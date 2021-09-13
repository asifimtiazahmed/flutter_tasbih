import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ultimate_tasbih_app/services/app_strings.dart';
import 'package:ultimate_tasbih_app/services/const.dart';
import 'package:ultimate_tasbih_app/services/styles.dart';

class SliderSwitch extends StatelessWidget {
  const SliderSwitch({
    Key? key,
    required this.simpleOption,
    required this.duaOption,
  }) : super(key: key);
  final Function simpleOption;
  final Function duaOption;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SliderViewModel(),
      child: Consumer<SliderViewModel>(
        builder: (context, svm, _) {
          return GestureDetector(
            onTap: () {
              svm.toggleSwitch(
                  simpleOption: this.simpleOption,
                  duaOption: this
                      .duaOption); //changes the selected bool (simple, myDua)
            },
            onHorizontalDragEnd: (value) {
              svm.toggleSwitch(
                  simpleOption: this.simpleOption, duaOption: this.duaOption);
            },
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: AnimatedContainer(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width *
                            0.42 *
                            0.5 *
                            svm.getSliderMarginSwitch), //This SWITCH WILL MULTIPLY WITH 0 or 1 enabling the padding and animating the container
                    duration: Duration(milliseconds: 200),
                    curve: Curves.decelerate,
                    height: 32,
                    width: MediaQuery.of(context).size.width * 0.46 * 0.5,
                    decoration: BoxDecoration(
                      color: fawn,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                Align(
                  //THIS IS THE BORDER
                  alignment: Alignment.center,
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.46,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: fawn, width: 2),
                      color: Colors.transparent,
                    ),
                  ),
                ),
                Align(
                  //THIS IS THE TEXT
                  alignment: Alignment.center,
                  child: Container(
                    //Text
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.46,
                    //color: fawn,
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          AppStrings.SIMPLE,
                          style: AppStyle.body.copyWith(
                              color: svm.getSimple ? cornSilk : kombuGreen,
                              fontWeight: FontWeight.w800),
                        ),
                        Text(
                          AppStrings.MY_DUA,
                          style: AppStyle.body.copyWith(
                              color: svm.getMyDua ? cornSilk : kombuGreen,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class SliderViewModel extends ChangeNotifier {
  bool _simple = true;
  bool _myDua = false;
  double _sliderMarginSwitch = 0;

  bool get getSimple => _simple;
  bool get getMyDua => _myDua;
  double get getSliderMarginSwitch => _sliderMarginSwitch;

  void toggleSwitch(
      {required Function simpleOption, required Function duaOption}) {
    if (_simple) {
      _simple = false;
      _myDua = true;
      _sliderMarginSwitch = 1;
      duaOption();
    } else {
      _simple = true;
      _myDua = false;
      _sliderMarginSwitch = 0;
      simpleOption();
    }
    notifyListeners();
  }
}
