import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ultimate_tasbih_app/models/dua.dart';
import 'package:ultimate_tasbih_app/screens/dua_entry_screen/widgets/tab_button.dart';
import 'package:ultimate_tasbih_app/services/app_strings.dart';
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
          return SafeArea(
            child: Scaffold(
              backgroundColor: cornSilk,
              body: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(children: [
                        TabButton(
                            btnText: AppStrings.BTN_DUA,
                            tap: vm.duaButtonTap,
                            isSelected: vm.duaButtonSelected),
                        TabButton(
                            btnText: AppStrings.BTN_TASBIH_LIST,
                            tap: vm.tasbihButtonTap,
                            isSelected: vm.tasbihButtonSelected),
                        Spacer(),
                        IconButton(
                          onPressed: () {
                            //TODO: THIS WILL BRING UP ALERT DIALOGUE to ADD DUA
                          },
                          icon: Icon(FluentIcons.add_24_filled,
                              color: liverDogs, size: 28),
                        ),
                      ]),
                    ),
                    Expanded(
                      flex: 6,
                      child: ListView.builder(
                          itemCount: 50,
                          itemBuilder: (BuildContext context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          color: kombuGreen, width: 1.0),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'this is $index',
                                        style: AppStyle.title.copyWith(
                                            color: kombuGreen, fontSize: 18),
                                      ),
                                      IconButton(
                                        icon: Icon(
                                            FluentIcons
                                                .more_horizontal_24_filled,
                                            color: kombuGreen),
                                        onPressed: () {},
                                      ),
                                    ],
                                  )),
                            );
                          }),
                    ),
                    // TextField(
                    //   decoration: InputDecoration(
                    //     labelText: 'Enter dua title',
                    //   ),
                    //   controller: _titleController,
                    //   onChanged: (value) {
                    //     //print(value);
                    //     vm.duaTitle = value;
                    //   },
                    // ),
                    // TextField(
                    //   decoration: InputDecoration(
                    //     labelText: 'Dua',
                    //   ),
                    //   onChanged: (value) {
                    //     vm.duaText = value;
                    //   },
                    // ),
                    // TextField(
                    //   decoration: InputDecoration(
                    //     labelText: 'number of times',
                    //   ),
                    //   onChanged: (value) {
                    //     vm.duaTimes = int.parse(value);
                    //   },
                    // ),
                    // OutlinedButton(
                    //   onPressed: () {
                    //     vm.addToList();
                    //   },
                    //   child: Text(
                    //     'Submit',
                    //     style: AppStyle.title.copyWith(color: kombuGreen),
                    //   ),
                    // ),
                    Container(
                      height: 200,
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
//FIELDS
// ==================
  String duaTitle = '';
  String duaText = '';
  int duaTimes = 0;
  List<Dua> _allDua = [];
  bool isValid = false;
  bool duaButtonSelected = true;
  bool tasbihButtonSelected = false;

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

  void duaButtonTap() {
    duaButtonSelected = true;
    tasbihButtonSelected = false;
    print('dua button tapped');
    notifyListeners();
  }

  void tasbihButtonTap() {
    duaButtonSelected = false;
    tasbihButtonSelected = true;
    print('tasbih list button tapped');
    notifyListeners();
  }
}
