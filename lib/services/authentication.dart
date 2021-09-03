import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

enum ApplicationLoginState {
  loggedOut,
  emailAddress,
  register,
  password,
  loggedIn,
  loggedInAnonymous,
  reset,
}

class ApplicationState extends ChangeNotifier {
  ApplicationState() {
    init();
  }
  var _isPasswordObscured = true;

  ApplicationLoginState _loginState = ApplicationLoginState.loggedIn;
  String? _email;
  String? get email => _email;

  ApplicationLoginState get loginState => _loginState;

  void showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        //duration: Duration(milliseconds: 500),
      ),
    );
    notifyListeners();
  }

  Future<void> init() async {
    await Firebase.initializeApp();

    FirebaseAuth.instance.userChanges().listen((user) {
      if (user != null) {
        _loginState = ApplicationLoginState.loggedIn;
        print('user found, logging in');
      } else {
        _loginState = ApplicationLoginState.loggedOut;
        print('user not found');
      }
      notifyListeners();
    });
  }

  Future<void> resetPassword(String email,
      void Function(FirebaseAuthException e) errorCallback) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      _loginState = ApplicationLoginState.reset;
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
    notifyListeners();
  }

  void signInAsGuestUser(
    BuildContext context,
    void Function(FirebaseAuthException e) errorCallback,
  ) async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
      //print(userCredential.user);
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
    print('signed in as anonymous');
    _loginState = ApplicationLoginState.loggedInAnonymous;
    notifyListeners();
  }

  Future<User?> getCurrentUser() async {
    {
      var user = FirebaseAuth.instance.currentUser;
      return user;
    }
  }

  void startLoginFlow() {
    _loginState = ApplicationLoginState.emailAddress;
    notifyListeners();
  }

  void verifyEmail(
    String email,
    void Function(FirebaseAuthException e) errorCallback,
  ) async {
    try {
      var methods =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
      if (methods.contains('password')) {
        print('USER ALREADY EXISTS');
        _loginState = ApplicationLoginState.password;
      } else {
        _loginState = ApplicationLoginState.register;
      }
      _email = email;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  void cancelRegistration() {
    _loginState = ApplicationLoginState.emailAddress;
    notifyListeners();
  }

  Future<void> registerAccount(
      String email,
      String password,
      String displayName,
      void Function(FirebaseAuthException e) errorCallback) async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await credential.user!.updateDisplayName(displayName);
      _loginState = ApplicationLoginState.register;
      sendEmailVerificationLink();
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
    notifyListeners();
  }

  Future<void> signInWithEmailAndPassword(String email, String password,
      void Function(FirebaseAuthException e) errorCallback) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      _loginState = ApplicationLoginState.loggedIn;
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
    notifyListeners();
  }

  void sendEmailVerificationLink() {
    var user = FirebaseAuth.instance.currentUser;
    user?.sendEmailVerification();
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
    _loginState = ApplicationLoginState.loggedOut;
    notifyListeners();
  }

  String? validateEmail(value) {
    Pattern pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = new RegExp(pattern.toString());
    if (value == null || value == '') {
      return 'The email field cannot be empty';
    } else if (!regex.hasMatch(value) || value == null) {
      return 'Please enter a valid email address';
    } else if (_loginState == ApplicationLoginState.password) {
      return 'User with that email already exists';
    }
  }

  //TODO: Create a function to validate the email address, that is,
  // it will cehck if the user has his/her email address validated and ask
  //the user to validate their email.

  String? validateDisplayName(value) {
    if (value == null || value == '') {
      return 'Display name cannot be blank';
    }
  }

  String? validatePassword(value) {
    if (value == null || value == '') {
      return 'Password cannot be blank';
    } else if (value.length < 6) {
      return 'The password must be at least 6 characters long.';
    }
  }

  bool get isPasswordObscured => _isPasswordObscured;

  void showPassword() {
    (_isPasswordObscured)
        ? _isPasswordObscured = false
        : _isPasswordObscured = true;
    notifyListeners();
  }

// Database Function
  Future<DocumentReference> addMessageToGuestBook(String message) {
    if (_loginState != ApplicationLoginState.loggedIn) {
      throw Exception('Must be loged in');
    }
    return FirebaseFirestore.instance.collection('questbook').add({
      'text': message,
      'time': DateTime.now().millisecondsSinceEpoch,
      'userId': FirebaseAuth.instance.currentUser!.uid,
    });
  }
}
