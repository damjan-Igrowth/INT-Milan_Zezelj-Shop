import 'package:flutter/material.dart';
import 'package:tech_byte/utils/colors.dart';
import 'package:tech_byte/utils/constants.dart';

class TBAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  @override
  final Size preferredSize;
  const TBAppBar({super.key, this.title, this.actions})
      : preferredSize = const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: false,
      titleSpacing: Navigator.of(context).canPop() ? -5 : null,
      leading: Navigator.of(context).canPop()
          ? IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Image.asset(
                "assets/chevron_left_icon.png",
                height: TBDimensions.appBar.iconSize,
                width: TBDimensions.appBar.iconSize,
              ))
          : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(TBDimensions.appBar.borderRadius),
            bottomRight: Radius.circular(TBDimensions.appBar.borderRadius)),
      ),
      title: title == null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset("assets/app_bar_icon.png",
                    height: TBDimensions.appBar.iconSize,
                    width: TBDimensions.appBar.iconSize),
                const SizedBox(width: 5),
                ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (bounds) => LinearGradient(colors: [
                    TBColor.appBar.greenGradientColor,
                    TBColor.appBar.blueGradientColor
                  ]).createShader(
                      Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                          fontSize: TBDimensions.appBar.specialTitleFontSize,
                          color: Colors.black),
                      children: const [
                        TextSpan(text: "Tech"),
                        TextSpan(
                            text: "Byte",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                )
              ],
            )
          : Text(
              title!,
              style: TextStyle(
                  fontSize: TBDimensions.appBar.titleFontSize,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Inter"),
            ),
      actions: title == null ? null : actions,
    );
  }
}
