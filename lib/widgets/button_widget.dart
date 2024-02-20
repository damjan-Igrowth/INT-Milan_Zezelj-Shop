import 'package:flutter/material.dart';
import 'package:tech_byte/utils/colors.dart';
import 'package:tech_byte/utils/constants.dart';

enum TBButtonType { filled, outlined }

class TBButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final TBButtonType type;
  final bool isLoading;

  const TBButton({
    super.key,
    this.onPressed,
    required this.text,
    required this.type,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ButtonStyle(
        elevation: const MaterialStatePropertyAll(0),
        padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
          vertical: TBDimensions.button.verticalPadding,
          horizontal: TBDimensions.button.horizontalPadding,
        )),
        minimumSize: MaterialStatePropertyAll(
          Size.fromHeight(TBDimensions.button.minimumHeight),
        ),
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (type == TBButtonType.filled) {
              if (states.contains(MaterialState.disabled)) {
                return isLoading ? TBColor.lightBlue : TBColor.lightBlueGrey;
              }
              return TBColor.lightBlue;
            } else {
              return Colors.white;
            }
          },
        ),
        textStyle: const MaterialStatePropertyAll(
          TextStyle(
            overflow: TextOverflow.ellipsis,
            fontSize: 16,
            fontFamily: "Inter",
            fontWeight: FontWeight.w600,
          ),
        ),
        foregroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (type == TBButtonType.filled) {
              if (states.contains(MaterialState.disabled)) {
                return isLoading ? Colors.white : TBColor.grey;
              }
              return Colors.white;
            }
            return Colors.black;
          },
        ),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(TBDimensions.button.borderRadius),
            side: type == TBButtonType.filled
                ? BorderSide.none
                : const BorderSide(
                    color: TBColor.buttonBorderColor,
                    width: 1,
                  ),
          ),
        ),
      ),
      child: isLoading
          ? SizedBox(
              height: TBDimensions.icon.size,
              width: TBDimensions.icon.size,
              child: CircularProgressIndicator(
                color:
                    type == TBButtonType.filled ? Colors.white : Colors.black,
                strokeWidth: TBDimensions.app.circularIndicatorWidth,
              ),
            )
          : Text(
              text,
            ),
    );
  }
}
