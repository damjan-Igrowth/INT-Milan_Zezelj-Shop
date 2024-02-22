import 'package:flutter/material.dart';
import 'package:tech_byte/utils/colors.dart';
import 'package:tech_byte/utils/constants.dart';

class TBTextInput extends StatefulWidget {
  final TextEditingController textEditingController;
  final String label;
  final String? Function(String?)? validator;
  final bool? enabled;
  const TBTextInput(
      {super.key,
      required this.textEditingController,
      required this.label,
      this.validator,
      this.enabled});

  @override
  State<TBTextInput> createState() => _TBTextInputState();
}

class _TBTextInputState extends State<TBTextInput> {
  final FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enabled,
      onTapOutside: (event) {
        _focusNode.unfocus();
      },
      validator: widget.validator,
      controller: widget.textEditingController,
      focusNode: _focusNode,
      style: MaterialStateTextStyle.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return TextStyle(
                color: TBColor.textInput.grey,
                fontFamily: "Inter",
                fontSize: 16,
                fontWeight: FontWeight.w600);
          }

          return TextStyle(
              color: TBColor.textInput.black,
              fontFamily: "Inter",
              fontSize: 16,
              fontWeight: FontWeight.w600);
        },
      ),
      decoration: InputDecoration(
        filled: true,
        contentPadding: EdgeInsets.symmetric(
            vertical: TBDimensions.textInput.verticalContentPadding,
            horizontal: TBDimensions.textInput.verticalContentPadding),
        labelText: widget.label,
        labelStyle: MaterialStateTextStyle.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return TextStyle(
              color: TBColor.textInput.grey,
              fontFamily: "Inter",
              fontSize: 12,
              fontWeight: FontWeight.w400,
            );
          }
          if (states.contains(MaterialState.error) &&
              states.contains(MaterialState.focused)) {
            return TextStyle(
              color: TBColor.textInput.red,
              fontFamily: "Inter",
              fontSize: 12,
              fontWeight: FontWeight.w400,
            );
          }
          if (states.contains(MaterialState.focused)) {
            return TextStyle(
              color: TBColor.textInput.purple,
              fontFamily: "Inter",
              fontSize: 12,
              fontWeight: FontWeight.w400,
            );
          }
          return TextStyle(
            color: TBColor.textInput.black,
            fontFamily: "Inter",
            fontSize: 16,
            fontWeight: FontWeight.w400,
          );
        }),
        fillColor: MaterialStateColor.resolveWith(
          (states) {
            if (states.contains(MaterialState.disabled)) {
              return TBColor.textInput.disabledFillColor;
            }
            return Colors.white;
          },
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(TBDimensions.textInput.borderRadius),
          borderSide: BorderSide(
            color: TBColor.textInput.lightGrey,
            width: 1,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(TBDimensions.textInput.borderRadius),
          borderSide: BorderSide(
            color: TBColor.textInput.lightGrey,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(TBDimensions.textInput.borderRadius),
          borderSide: BorderSide(
            color: TBColor.textInput.purple,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(TBDimensions.textInput.borderRadius),
          borderSide: BorderSide(
            color: TBColor.textInput.red,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(TBDimensions.textInput.borderRadius),
          borderSide: BorderSide(
            color: TBColor.textInput.red,
            width: 1,
          ),
        ),
        errorStyle: TextStyle(
          color: TBColor.textInput.red,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          height: 0.2,
        ),
      ),
    );
  }
}
