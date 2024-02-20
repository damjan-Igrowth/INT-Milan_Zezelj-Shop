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
                height: kIconSize,
                width: kIconSize,
              ))
          : null,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(kAppBarBorderRadius),
            bottomRight: Radius.circular(kAppBarBorderRadius)),
      ),
      title: title == null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset("assets/app_bar_icon.png", height: 32, width: 32),
                const SizedBox(width: 5),
                ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [tbAppBarGradientColor1, tbAppBarGradientColor2],
                  ).createShader(
                    Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                  ),
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(fontSize: 23.33, color: Colors.black),
                      children: [
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
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
      actions: title == null ? null : actions,
    );
  }
}
