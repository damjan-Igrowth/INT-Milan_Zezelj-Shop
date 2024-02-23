import 'package:flutter/material.dart';
import 'package:tech_byte/utils/colors.dart';
import 'package:tech_byte/utils/constants.dart';

enum _TBGaleryImageType { url, asset }

class TBGalery extends StatelessWidget {
  final PageController _pageController = PageController(
    viewportFraction: TBDimensions.galery.viewportFraction,
  );
  final List<String> images;
  final _TBGaleryImageType _imageType;

  TBGalery.url({super.key, required this.images})
      : _imageType = _TBGaleryImageType.url;
  TBGalery.asset({super.key, required this.images})
      : _imageType = _TBGaleryImageType.asset;

  @override
  Widget build(BuildContext context) {
    double galeryHeight = MediaQuery.of(context).size.width -
        (MediaQuery.of(context).size.width *
            (1 - TBDimensions.galery.viewportFraction)) -
        TBDimensions.galery.imagePadding * 2;
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: TBDimensions.galery.verticalPadding),
      child: SizedBox(
        height: galeryHeight,
        width: MediaQuery.of(context).size.width,
        child: PageView.builder(
          controller: _pageController,
          itemCount: images.length,
          itemBuilder: (BuildContext context, int itemIndex) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: TBDimensions.galery.imagePadding,
              ),
              child: LayoutBuilder(
                builder: (context, BoxConstraints constraints) {
                  return ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: _imageType == _TBGaleryImageType.asset
                          ? Image.asset(
                              images[itemIndex],
                              fit: BoxFit.fill,
                            )
                          : Image.network(
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                return Container(
                                    padding: EdgeInsets.all(galeryHeight * 0.4),
                                    child: CircularProgressIndicator(
                                        strokeWidth: 3,
                                        color: TBColor.app.lightBlue));
                              },
                              images[itemIndex],
                              fit: BoxFit.fill,
                            ));
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
