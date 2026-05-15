import 'package:flutter/material.dart';

class Loading {
  final BuildContext context;

  Loading(this.context);

  Future<void> start({bool? withBackground}) async {
    return await showDialog<void>(
      context: context,
      barrierDismissible: true,
      barrierColor: withBackground == true ? Colors.white54 : Colors.black54,
      builder: (BuildContext context) {
        return PopScope(
          canPop: false,
          child: SimpleDialog(
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    duration: const Duration(seconds: 5),
                    width: 60,
                    height: 60,
                    child: CircularProgressIndicator.adaptive(),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> stop() async {
    Navigator.of(context, rootNavigator: true).pop();
  }
}
