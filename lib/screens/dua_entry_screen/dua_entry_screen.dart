import 'package:flutter/material.dart';
import 'package:ultimate_tasbih_app/models/dua.dart';
import 'package:ultimate_tasbih_app/services/const.dart';
import 'package:ultimate_tasbih_app/services/styles.dart';
import 'package:provider/provider.dart';
import 'package:ultimate_tasbih_app/services/validtors.dart';

class DuaEntryScreen extends StatelessWidget {
  DuaEntryScreen({Key? key}) : super(key: key);
  static const String routeName = 'duaEntryScreen';
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _duaTextController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DuaEntryViewModel(),
      child: Consumer<DuaEntryViewModel>(
        builder: (context, vm, _) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Text(
                    'Dua Entry Page',
                    style: AppStyle.title,
                  ),
                  Divider(
                    height: 5,
                    color: kombuGreen,
                    indent: 25,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Enter dua title',
                    ),
                    controller: _titleController,
                    onChanged: (value) {
                      //print(value);
                      vm.duaTitle = value;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Dua',
                    ),
                    onChanged: (value) {
                      vm.duaText = value;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'number of times',
                    ),
                    onChanged: (value) {
                      vm.duaTimes = int.parse(value);
                    },
                  ),
                  OutlinedButton(
                    onPressed: () {
                      vm.addToList();
                    },
                    child: Text(
                      'Submit',
                      style: AppStyle.title.copyWith(color: kombuGreen),
                    ),
                  ),
                  Container(
                    height: 300,
                    child: ListView.builder(
                      itemCount: vm._allDua.length,
                      itemBuilder: (BuildContext context, index) {
                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(vm._allDua[index].title),
                            Text(vm._allDua[index].totalCount.toString()),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class DuaEntryViewModel extends ChangeNotifier {
  DuaEntryViewModel() {
    //Initialize the view model by retrieving previous data
  }

  String duaTitle = '';
  String duaText = '';
  int duaTimes = 0;
  List<Dua> _allDua = [];
  bool isValid = false;

  //Going to bring in a Validator class to have the error text or have success text on there
  Validators _text = Validators();

  //Validate and set
  void validateTitleInput(String title) {
    if (title == '' || title.length <= 3) {
      _text.errorText = 'Must enter a valid title';
    } else {
      _text.text = title;
    }
    notifyListeners();
  }

//Validate and set
  String? validateTextInput(text) {
    if (text.toString() == '' && text.toString().length <= 3) {
      return 'Must enter some text here';
    } else
      duaText = text.toString();
    notifyListeners();
    return 'success';
  }

  addToList() {
    print('$duaTitle  + $duaText');
    _allDua
        .add(Dua(description: duaText, title: duaTitle, totalCount: duaTimes));
    print(_allDua[0].title);
    notifyListeners();
  }
}
