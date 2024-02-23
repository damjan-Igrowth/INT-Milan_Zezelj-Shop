import 'package:flutter/material.dart';
import 'package:tech_byte/utils/colors.dart';
import 'package:tech_byte/utils/constants.dart';

class TBTextInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final String label;
  final String? Function(String?)? validator;
  final bool? enabled;
  final bool readOnly;
  final Widget? suffixIcon;
  final String? suffixText;
  final void Function()? onTap;
  const TBTextInput(
      {super.key,
      required this.textEditingController,
      required this.label,
      this.validator,
      this.readOnly = false,
      this.enabled,
      this.suffixIcon,
      this.suffixText,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      readOnly: readOnly,
      enabled: enabled,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      validator: validator,
      controller: textEditingController,
      style: MaterialStateTextStyle.resolveWith(
        (states) {
          Color color = TBColor.textInput.black;
          if (states.contains(MaterialState.disabled)) {
            color = TBColor.textInput.grey;
          }

          return TextStyle(
              color: color,
              fontFamily: "Inter",
              fontSize: 16,
              fontWeight: FontWeight.w600);
        },
      ),
      decoration: InputDecoration(
        suffixText: suffixText,
        suffixIcon: suffixIcon,
        suffixIconColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return TBColor.textInput.grey;
          }
          return TBColor.textInput.lightBlue;
        }),
        filled: true,
        contentPadding: EdgeInsets.symmetric(
            vertical: TBDimensions.textInput.verticalContentPadding,
            horizontal: TBDimensions.textInput.horizontalContentPadding),
        labelText: label,
        floatingLabelStyle: MaterialStateTextStyle.resolveWith((states) {
          Color color = TBColor.textInput.black;

          if (states.contains(MaterialState.disabled)) {
            color = TBColor.textInput.grey;
          } else if (states.contains(MaterialState.error)) {
            color = TBColor.textInput.red;
          } else if (states.contains(MaterialState.focused)) {
            color = TBColor.textInput.purple;
          }
          return TextStyle(
            color: color,
            fontFamily: "Inter",
            fontSize: 12,
            fontWeight: FontWeight.w400,
          );
        }),
        labelStyle: MaterialStateTextStyle.resolveWith((states) {
          Color color = TBColor.textInput.black;
          if (states.contains(MaterialState.disabled)) {
            color = TBColor.textInput.grey;
          } else if (states.contains(MaterialState.error)) {
            color = TBColor.textInput.red;
          }
          return TextStyle(
            color: color,
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
