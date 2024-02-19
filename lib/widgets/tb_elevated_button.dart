import 'package:flutter/material.dart';
import 'package:tech_byte/utils/colors.dart';
import 'package:tech_byte/utils/constants.dart';

enum TBButtonType { primary, secondary }

class TBButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final bool enabled;
  final TBButtonType type;
  final bool isLoading;

  const TBButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.type,
    this.enabled = true,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kButtonHeight,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: enabled ? onPressed : null,
        style: ButtonStyle(
          elevation: type == TBButtonType.primary
              ? null
              : const MaterialStatePropertyAll(0),
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) {
              if (type == TBButtonType.primary) {
                if (states.contains(MaterialState.disabled)) {
                  return tbLightBlueGrey;
                }
                return tbLightBlue;
              } else {
                return Colors.white;
              }
            },
          ),
          foregroundColor: MaterialStateProperty.resolveWith(
            (states) {
              if (type == TBButtonType.primary) {
                if (states.contains(MaterialState.disabled)) {
                  return tbGrey;
                }
                return Colors.white;
              }
              return Colors.black;
            },
          ),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kButtonBorderRadius),
              side: type == TBButtonType.primary
                  ? BorderSide.none
                  : const BorderSide(
                      color: tbButtonBorderColor,
                      width: 1,
                    ),
            ),
          ),
        ),
        child: isLoading
            ? SizedBox(
                height: kIconSize,
                width: kIconSize,
                child: CircularProgressIndicator(
                  color: type == TBButtonType.primary
                      ? Colors.white
                      : Colors.black,
                  strokeWidth: kCircularIndicatorWidth,
                ),
              )
            : Text(
                text,
                style: const TextStyle(fontSize: 16),
              ),
      ),
    );
  }
}
