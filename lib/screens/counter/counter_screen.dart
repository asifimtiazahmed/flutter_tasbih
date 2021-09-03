import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:ultimate_tasbih_app/services/app_strings.dart';
import 'package:ultimate_tasbih_app/services/authentication.dart';
import 'package:provider/provider.dart';
import 'package:ultimate_tasbih_app/widgets/appBar.dart';
import 'package:ultimate_tasbih_app/widgets/counter_indicator.dart';
import 'package:ultimate_tasbih_app/widgets/main_menu_drawer.dart';

import '../../widgets/circle_counter.dart';

import '../../services/const.dart';

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
          child: Scaffold(
            drawer: MainDrawer(),
            endDrawer: MainDrawer(),
            appBar: utAppBar,
            backgroundColor: cornSilk,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: mediaQuery.height * 0.08,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CounterProgressIndicator(
                        currentValue: vm.getCounterValue(),
                        totalValue: vm.getTotalCountValue(),
                        progressIndicator: vm.getProgressIndicator(),
                        heightAndWidth: 200),
                  ),
                  Stack(children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Container(
                        width: mediaQuery.width * 0.85,
                        height: mediaQuery.height * 0.25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.transparent,
                          border: Border.all(color: kombuGreen, width: 2),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(20),
                          child: SingleChildScrollView(
                            child: Text(
                              'd',
                              style: TextStyle(
                                  backgroundColor: cornSilk,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 25,
                                  color: kombuGreen),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 30,
                      top: -11,
                      child: Container(
                        color: cornSilk,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Prayer',
                            style: TextStyle(
                                backgroundColor: cornSilk,
                                fontWeight: FontWeight.w800,
                                fontSize: 20,
                                color: kombuGreen),
                          ),
                        ),
                      ),
                    ),
                  ]),
                  Padding(
                    padding: EdgeInsets.only(top: 18.0),
                    child: CircleCounterButton(
                      onPressed: () {
                        vm.increment();
                      },
                    ),
                  ),
                ],
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

  int _currentCountValue = 0;
  int _totalCountValue = 100;
  double _progressIndicator = 0.0;

  init() {
    //TODO: get stored counter values, and last dua that was there
    _currentCountValue = 1;
    _totalCountValue = 100;
    _progressIndicator = 0.0;
  }

  setCounter(int value) => _currentCountValue = value;

  int getCounterValue() => _currentCountValue;
  int getTotalCountValue() => _totalCountValue;
  double getProgressIndicator() => _progressIndicator;

  void increment() {
    _currentCountValue++;
    updateProgressIndicator();
    notifyListeners();
  }

  updateProgressIndicator() {
    double retVal = 0.0;
    if (_currentCountValue == 0) {
      retVal = 0.0;
    } else if (_currentCountValue / _totalCountValue <= 1 &&
        _totalCountValue != 0) {
      retVal = _currentCountValue / _totalCountValue;
      print(_progressIndicator);
    } else if (_currentCountValue >= _totalCountValue) {
      retVal = 1;
    }
    _progressIndicator = retVal;
    notifyListeners();
  }

  void saveCurrentDua() {
    //TODO: Save current state into SharedPrefs and firebase
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
