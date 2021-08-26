import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

enum ApplicationLoginState {
  loggedOut,
  emailAddress,
  register,
  password,
  loggedIn,
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

  void registerAccount(String email, String password, String displayName,
      void Function(FirebaseAuthException e) errorCallback) async {
    try {
      var credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await credential.user!.updateDisplayName(displayName);
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  void signInWithEmailAndPassword(String email, String password,
      void Function(FirebaseAuthException e) errorCallback) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
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

  get isPasswordObscured => _isPasswordObscured;

  void showPassword() {
    (_isPasswordObscured)
        ? _isPasswordObscured = false
        : _isPasswordObscured = true;
    notifyListeners();
  }
}
