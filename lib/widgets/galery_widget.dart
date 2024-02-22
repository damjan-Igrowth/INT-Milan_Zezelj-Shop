import 'package:flutter/material.dart';
import 'package:tech_byte/utils/colors.dart';
import 'package:tech_byte/utils/constants.dart';

enum _TBGalleryImageType { url, asset }

class TBGallery extends StatelessWidget {
  final PageController _pageController = PageController(
    viewportFraction: TBDimensions.galery.viewportFraction,
  );
  final List<String> images;
  final _TBGalleryImageType _imageType;

  TBGallery.url({super.key, required this.images})
      : _imageType = _TBGalleryImageType.url;
  TBGallery.asset({super.key, required this.images})
      : _imageType = _TBGalleryImageType.asset;

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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: _imageType == _TBGalleryImageType.asset
                    ? Image.asset(
                        images[itemIndex],
                        fit: BoxFit.fill,
                      )
                    : Image.network(
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress != null) {
                            if (loadingProgress.expectedTotalBytes != 0) {
                              return Container(
                                  padding: EdgeInsets.all(galeryHeight * 0.4),
                                  child: CircularProgressIndicator(
                                      strokeWidth: 3,
                                      color: TBColor.app.lightBlue));
                            }
                          }
                          return child;
                        },
                        images[itemIndex],
                        fit: BoxFit.fill,
                      ),
              ),
            );
          },
        ),
      ),
    );
  }
}
