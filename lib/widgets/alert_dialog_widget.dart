import 'package:flutter/material.dart';
import 'package:tech_byte/utils/colors.dart';
import 'package:tech_byte/utils/constants.dart';
import 'package:tech_byte/utils/icons.dart';
import 'package:tech_byte/widgets/button_widget.dart';

enum _TBAlertDialogType { error, success }

class TBAlertDialog extends StatelessWidget {
  final void Function() onPressed;
  final String message;
  final _TBAlertDialogType _type;

  const TBAlertDialog.error(
      {super.key, required this.onPressed, required this.message})
      : _type = _TBAlertDialogType.error;
  const TBAlertDialog.success(
      {super.key, required this.onPressed, required this.message})
      : _type = _TBAlertDialogType.success;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(TBDimensions.alert.borderRadius)),
      backgroundColor: Colors.white,
      elevation: 0,
      child: Container(
        padding: EdgeInsets.all(TBDimensions.alert.contentPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding:
                  EdgeInsets.only(bottom: TBDimensions.alert.contentPadding),
              child: _type == _TBAlertDialogType.error
                  ? CircleAvatar(
                      radius: TBDimensions.alert.iconSize,
                      backgroundColor: TBColor.alert.lightRed,
                      child: Icon(
                        TBIcons.error,
                        color: TBColor.alert.red,
                        size: TBDimensions.alert.iconSize,
                      ))
                  : CircleAvatar(
                      radius: TBDimensions.alert.iconSize,
                      backgroundColor: TBColor.alert.lightGreen,
                      child: Icon(
                        TBIcons.success,
                        color: TBColor.alert.green,
                        size: TBDimensions.alert.iconSize,
                      )),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: TBDimensions.alert.titlePadding),
              child: Text(
                  _type == _TBAlertDialogType.error ? "Error!" : "Success!",
                  style: const TextStyle(
                    fontFamily: "Inter",
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  )),
            ),
            Padding(
              padding:
                  EdgeInsets.only(bottom: TBDimensions.alert.contentPadding),
              child: Text(message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: "Inter",
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  )),
            ),
            _type == _TBAlertDialogType.error
                ? TBButton(
                    text: "Try again",
                    type: TBButtonType.outlined,
                    onPressed: onPressed,
                  )
                : TBButton(
                    text: "Continue",
                    type: TBButtonType.filled,
                    onPressed: onPressed,
                  ),
          ],
        ),
      ),
    );
  }
}
