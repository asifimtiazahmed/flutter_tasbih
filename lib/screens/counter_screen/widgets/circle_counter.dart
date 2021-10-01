import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../services/const.dart';

class CircleCounterButton extends StatelessWidget {
  CircleCounterButton({required this.onPressed});

  final onPressed;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ButtonViewModel(),
      child: Consumer<ButtonViewModel>(builder: (context, vm, _) {
        return ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            animationDuration: Duration(milliseconds: 200),
            splashFactory: NoSplash.splashFactory,
            elevation: MaterialStateProperty.all(8.0),
            shadowColor: MaterialStateProperty.all(liverDogs),
            backgroundColor: MaterialStateProperty.all(fawn),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(200.0),
                    side: BorderSide(color: liverDogs))),
          ),
          child: Icon(
            Icons.add,
            color: liverDogs,
            size: 40,
          ),
        );
      }),
    );
  }
}

class ButtonViewModel extends ChangeNotifier {
  final initialElevation = 9;
  final endElevation = 1;
}
