import 'package:flutter/material.dart';
import 'package:tech_byte/utils/colors.dart';
import 'package:tech_byte/utils/constants.dart';
import 'package:tech_byte/utils/icons.dart';

class TBAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final List<Widget>? actions;
  final Widget icon;
  final bool _styled;

  @override
  final Size preferredSize;
  TBAppBar({super.key, required this.title, this.actions, Widget? titleIcon})
      : icon = titleIcon ??
            Icon(
              TBIcons.appIcon,
              size: TBDimensions.appBar.iconSize,
            ),
        preferredSize = const Size.fromHeight(60),
        _styled = false;

  TBAppBar.styled(
      {super.key, required this.title, this.actions, Widget? titleIcon})
      : icon = titleIcon ??
            Icon(
              TBIcons.appIcon,
              size: TBDimensions.appBar.iconSize,
            ),
        preferredSize = const Size.fromHeight(60),
        _styled = true;

  @override
  Widget build(BuildContext context) {
    bool shouldImplyLeading = Navigator.of(context).canPop();
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: false,
      titleSpacing: shouldImplyLeading ? -5 : null,
      leading: shouldImplyLeading
          ? IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(
                Icons.chevron_left,
                size: TBDimensions.appBar.iconSize,
              ),
            )
          : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(TBDimensions.appBar.borderRadius),
            bottomRight: Radius.circular(TBDimensions.appBar.borderRadius)),
      ),
      title: _styled
          ? Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (bounds) => LinearGradient(colors: [
                    TBColor.appBar.greenGradientColor,
                    TBColor.appBar.blueGradientColor
                  ]).createShader(
                    Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                  ),
                  child: icon,
                ),
                const SizedBox(width: 5),
                ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (bounds) => LinearGradient(colors: [
                          TBColor.appBar.greenGradientColor,
                          TBColor.appBar.blueGradientColor
                        ]).createShader(
                            Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                    child: title)
              ],
            )
          : title,
      actions: actions,
    );
  }
}
