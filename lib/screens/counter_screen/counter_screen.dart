import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
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
                    print('library');
                  },
                  onChange: (String value) {
                    print(value);
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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Center(
                        child: Text(
                          AppStrings.TASBIH_TITLE,
                          style: AppStyle.title.copyWith(color: kombuGreen),
                        ),
                      ),
                    ),
                    Center(
                      child: Text('Tasbih List Slider'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: CounterProgressIndicator(
                          isOnlyIndicator: vm.isOnlyCounter,
                          currentValue: vm.getCounterValue(),
                          totalValue: vm.getTotalCountValue(),
                          progressIndicator: vm.getProgressIndicator(),
                          heightAndWidth: 200),
                    ),
                    PrayerDisplay(
                      width: mediaQuery.width * 0.85,
                      height: mediaQuery.height * 0.20,
                      duaText:
                          'lorem ipsum dolor emmet, this and that and other filler text just to cehck how things are going here and tehe and if there are at all any kind of bad overflow, and also I want to check the scrolling option, so all of it shoudl reall work out fien',
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 18.0),
                      child: Container(
                        height: 90,
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

  int _currentCountValue = 0;
  int _totalCountValue = 0;
  double _progressIndicator = 0.0;
  bool isOnlyCounter =
      true; //This will determine if the "Out of" is being shown or not
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

  final Dua testDua = Dua(
      title: 'All Prayers Tasbih',
      description:
          'Qulillahumma Maalikal Mulki, Tu\'til mulka Manta shaau, wa Tanzieul Mulka mim manta saau, wa tu\'ijju Manta shaau biaa dikal khair innaka\'ala kulli shai\'ien Kadir Tulijju laila finna haari watulijjunna... ',
      totalCount: 7);

  init() {
    //TODO: get stored counter values, and last dua that was there
    _currentCountValue = 1;
    _totalCountValue = 100;
    _progressIndicator = 0.0;
    isOnlyCounter = true;
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
