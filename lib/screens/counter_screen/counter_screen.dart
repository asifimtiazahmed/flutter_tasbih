import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:ultimate_tasbih_app/models/dua.dart';
import 'package:ultimate_tasbih_app/models/tasbih_list.dart';
import 'package:ultimate_tasbih_app/screens/counter_screen/widgets/counter_indicator.dart';
import 'package:ultimate_tasbih_app/services/app_strings.dart';
import 'package:ultimate_tasbih_app/services/authentication.dart';
import 'package:provider/provider.dart';
import 'package:ultimate_tasbih_app/services/styles.dart';
import 'package:ultimate_tasbih_app/widgets/main_menu_drawer.dart';
import 'package:ultimate_tasbih_app/widgets/new_app_bar.dart';
import 'widgets/circle_counter.dart';
import '../../services/const.dart';
import 'widgets/dua_display_widget.dart';

class CounterScreen extends StatelessWidget {
  static const String routeName = AppStrings.COUNTER_SCREEN_ROUTENAME;

  @override
  Widget build(BuildContext context) {
    var _applicationState = Provider.of<ApplicationState>(context);

    final mediaQuery = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (_) => CounterScreenViewModel(),
      child: Consumer<CounterScreenViewModel>(
        builder: (context, vm, _) => SafeArea(
          child: SafeArea(
            child: Scaffold(
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(80.0),
                child: TasbihAppBar(
                  globeTap: () {
                    print('global tap');
                  },
                  libraryTap: () {
                    print('library Test');
                    vm.tasbihListProcess(vm.testTasbihList);
                  },
                  onChange: (String value) {
                    vm.toggleSwitch(value);
                  },
                ),
              ),
              endDrawer: MainDrawer(),
              backgroundColor: cornSilk,
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    //TASBIH TITLE
                    vm.counterStateIsSimple
                        ? Container()
                        : Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Center(
                              child: Text(
                                vm.tasbihTitle,
                                style:
                                    AppStyle.title.copyWith(color: kombuGreen),
                              ),
                            ),
                          ),
                    //TASBIH SLIDER
                    vm.counterStateIsSimple
                        ? Container()
                        : vm.isTasbih
                            ? Center(
                                child: Text('Tasbih List Slider'),
                              )
                            : Container(),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: CounterProgressIndicator(
                          isOnlyIndicator: vm.counterStateIsSimple,
                          currentValue: vm.getCounterValue(),
                          totalValue: vm.getTotalCountValue(),
                          progressIndicator: vm.getProgressIndicator(),
                          heightAndWidth: 200),
                    ),
                    //PRAYER DISPLAY TEXT
                    Visibility(
                      visible: !vm.counterStateIsSimple,
                      child: PrayerDisplay(
                        width: mediaQuery.width * 0.85,
                        height: mediaQuery.height * 0.20,
                        duaText: vm.prayerText,
                      ),
                    ),
                    vm.counterStateIsSimple
                        ? SizedBox(
                            height: MediaQuery.of(context).size.height * 0.35,
                          )
                        : Container(),
                    Padding(
                      padding: EdgeInsets.only(top: 18.0),
                      child: Container(
                        height: vm.counterStateIsSimple ? 90 : 190,
                        width: 90,
                        child: CircleCounterButton(
                          onPressed: () {
                            vm.increment();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CounterScreenViewModel extends ChangeNotifier {
  CounterScreenViewModel() {
    init();
  }
  //ALL FIELDS
  //================================================
  bool _isSimple = true;
  bool _isDua = false;
  bool _isTasbih = false;
  String _tasbihTitle = AppStrings.TASBIH_TITLE;
  String _prayerText = AppStrings.TEST_DUA;
  Dua currentDua = Dua(
    description: '',
    title: '',
    totalCount: 0,
  );

  int _currentCountValue = 0;
  int _totalCountValue = 0;
  double _progressIndicator = 0.0;
  bool isOnlyCounter =
      true; //This will determine if the "Out of" is being shown or not

  // DUMMY TASBIH LIST FOR TESTING
  //=================================
  final TasbihList testTasbihList = TasbihList(
      tasbihListTitle: '4 Dua for every prayer',
      listOfDua: [
        Dua(title: 'Dua 1', description: 'Subhan Allah', totalCount: 33),
        Dua(title: 'Dua 2', description: 'Alhamdulillah', totalCount: 33),
        Dua(title: 'Dua 3', description: 'Allahu Akbar', totalCount: 33),
        Dua(
            title: 'Dua 4',
            description:
                'La ilaha illallahu wahdahu, la sharika lahu, lahul-mulku wa lahul-hamdu, wa Huwa\'ala kulli shai\'in Qadir',
            totalCount: 1),
      ],
      description:
          'The Prophet(PBUH) said: His sins will be forgiven even if they are like the foam of the sea. (Sahih Muslim 597)');
// DUMMY DUA FOR TESTING
  //=================================
  final Dua testDua = Dua(
      title: 'All Prayers Tasbih',
      description:
          'Qulillahumma Maalikal Mulki, Tu\'til mulka Manta shaau, wa Tanzieul Mulka mim manta saau, wa tu\'ijju Manta shaau biaa dikal khair innaka\'ala kulli shai\'ien Kadir Tulijju laila finna haari watulijjunna... ',
      totalCount: 7);

  //GETTERS
  //=========================================
  int getCounterValue() => _currentCountValue;
  int getTotalCountValue() => _totalCountValue;
  double getProgressIndicator() => _progressIndicator;
  bool get counterStateIsSimple => _isSimple;
  String get tasbihTitle => _tasbihTitle;
  String get prayerText => _prayerText;
  bool get isTasbih => _isTasbih;

  //INITIALIZATION
  //=====================================
  init() {
    //TODO: get stored counter values, and last dua that was there
    //We want to initialize from shared prefs, for Simple, or for Dua
    _currentCountValue = 0;
    _totalCountValue = 100;
    _progressIndicator = 0.0;
    isOnlyCounter = true;
  }

// DUA SPECIFIC METHODS
  //===================================
  void duaProcess(Dua dua) {}

  //TASBIH LIST SPECIFIC METHODS
  //=======================================
  void tasbihListProcess(TasbihList list) {
    int _totalIndex = 0;
    int _currentIndex = 0;
    _isTasbih = true;
    _totalIndex = list.listOfDua.length; // Total number of Dua in the list
    //Loop through the current list of dua to find the last unfinished dua

    for (var x = 0; x < _totalIndex; x++) {
      if (list.listOfDua[x].lastCount < list.listOfDua[x].totalCount &&
          _currentIndex != list.listOfDua.length) {
        _currentIndex = x; //Selecting the first unfinished dua in the list
        print('current index: $_currentIndex');
        break;
      }
    }
    //Set the current golbal Dua object as the one in the list
    this.currentDua = list.listOfDua[_currentIndex];
    //Populate the Counter: //This is more like init
    populateCounter(); //This will add the counter increments  to the dua
    print(
        'populated the counter, total count of dua ${list.listOfDua.length} & current idex is $_currentIndex');
    //Update the counter'
    //TODO: THIS IS WHERE YOU PROMPT TO RESET COUNTER (Maybe Reset counter / Select another Dua)
    if (_currentIndex == list.listOfDua.length - 1) {
      print('All the dua in the list has been counted');
      print('resetting the tasbih');
      resetTasbih();
    }
  }

  //This function will populate the whole counter screen
  void populateCounter() {
    _tasbihTitle = currentDua.title;
    _totalCountValue = currentDua.totalCount;
    _currentCountValue = currentDua.lastCount;
    _prayerText = currentDua.description;
    notifyListeners(); //refreshes
  }

//This just updates the current cua
  void updateDua() {
    if (currentDua.lastCount < _totalCountValue) {
      this.currentDua.lastCount = _currentCountValue;
    }
    if (currentDua.lastCount == _totalCountValue) {
      tasbihListProcess(
          testTasbihList); //ERASE ME LATER This restarts the process
    }
  }

  void resetTasbih() {
    for (var i in testTasbihList.listOfDua) {
      i.lastCount = 0;
    }
  }

  void resetDua() {
    currentDua.lastCount = 0;
  }

  set setCounter(int value) => _currentCountValue = value;

  //TOGGLE SWITCH IN THE APP BAR
  void toggleSwitch(String value) {
    //This function is linked to the toggle switch and will change accordingly
    switch (value) {
      case ('dua'):
        _isDua = true;
        _isSimple = false;
        break;
      case ('simple'):
        _isSimple = true;
        _isDua = false;
    }
    notifyListeners();
  }

  void increment() {
    _currentCountValue++;
    if (_isDua) updateDua(); //ONLY UPDATE Dua if we are in Dua mode
    updateProgressIndicator(); //ALSO A FAILSAFE TO RESET THE INDICATOR SO NOT TO GET UNEXPECTED BEHAVIOUR
    notifyListeners();
  }

  void setOnlyIndicator(bool value) {
    isOnlyCounter = value;
    notifyListeners();
  }

  updateProgressIndicator() {
    double retVal = 0.0;
    if (_currentCountValue == 0) {
      retVal = 0.0;
    } else if (_currentCountValue / _totalCountValue <= 1 &&
        _totalCountValue != 0) {
      retVal = _currentCountValue / _totalCountValue;
    } else if (_currentCountValue >= _totalCountValue) {
      retVal = 1;
    }
    _progressIndicator = retVal;
    notifyListeners();
  }

  void saveCurrentDua() {
    //TODO: Save current state into SharedPrefs and firebase
  }
  void handleSettings(String value) {
    print(value);
  }
}

// DONE: change background color to cornSilk
// DONE: import neumorphic package
// TODO: Create folders in firebase such as feedback, playlist, dua list, current progress
// TODO: import storage package to keep the count in memory SharedPreferences
// TODO: Shift App bar to its own widget area
// TODO: Create a column to incorporate the dua space, counter, button
// TODO: Add in Settings left handed or Right handed
// TODO: Import Google font for most typing, counter
// TODO: implement the screen size MediaQery for responsiveness
// TODO: Design implement pastel colors for soothing eye
// TODO: Need to find a way to get frosted glass look for some of the slivers
// TODO: implement better buttons, maybe think about velocityX??
//TODO: Start making a routine that fits what you do - So edit the current one to reflect
// 14Feb 2021 git hub update 4
