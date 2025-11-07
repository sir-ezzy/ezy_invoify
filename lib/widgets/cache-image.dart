import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ImageCacheR extends StatelessWidget {
  final double height, width, topRadius, topBottom, blend;
  final String image;
  final bool fit;
  final bool chachedImage;
  final String? errorPlaceHolder;

  const ImageCacheR(
    this.image, {
    this.height = double.maxFinite,
    this.topRadius = 10,
    this.fit = true,
    this.blend = 0,
    this.errorPlaceHolder,
    this.topBottom = 10,
    this.width = double.maxFinite,
    super.key,
    this.chachedImage = false,
  });

  @override
  Widget build(BuildContext context) {
    var radius = BorderRadius.only(
      topRight: Radius.circular(topRadius),
      topLeft: Radius.circular(topRadius),
      bottomLeft: Radius.circular(topBottom),
      bottomRight: Radius.circular(topBottom),
    );

    return ClipRRect(
      borderRadius: radius,
      child: CachedNetworkImage(
        imageUrl: image,
        placeholder: (context, url) => Container(
          height: height,
          width: width,
          decoration: BoxDecoration(borderRadius: radius),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade400,
            highlightColor: Colors.grey.shade300,
            child: Container(
              height: height,
              decoration: BoxDecoration(color: Colors.grey.shade200),
            ),
          ),
        ),
        height: height,
        width: width,
        fit: fit ? BoxFit.cover : BoxFit.scaleDown,
        errorWidget: (context, url, error) {
          return Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  errorPlaceHolder ??
                      'https://unsplash.com/photos/a-woman-freelancer-working-on-laptop-sitting-on-a-pier-by-the-backyard-lake-a-concept-of-remote-office-work-during-vacation-yOuZaN3zqXc',
                ),
                fit: fit ? BoxFit.cover : BoxFit.scaleDown,
              ),
              borderRadius: radius,
            ),
          );
        },
      ),
    );
  }
}

class ImageCacheRD extends StatelessWidget {
  final double height, width, topRadius, topBottom, blend;
  final String image;
  final bool fit;
  final bool chachedImage;
  final String? errorPlaceHolder;

  const ImageCacheRD(
    this.image, {
    this.height = double.maxFinite,
    this.topRadius = 10,
    this.fit = true,
    this.blend = 0,
    this.errorPlaceHolder,
    this.topBottom = 10,
    this.width = double.maxFinite,
    super.key,
    this.chachedImage = false,
  });

  @override
  Widget build(BuildContext context) {
    var radius = BorderRadius.only(
      topRight: Radius.circular(topRadius),
      topLeft: Radius.circular(topRadius),
      bottomLeft: Radius.circular(topBottom),
      bottomRight: Radius.circular(topBottom),
    );

    return ClipRRect(
      borderRadius: radius,
      child: CachedNetworkImage(
        imageUrl: image,
        placeholder: (context, url) => Container(
          height: height,
          width: width,
          decoration: BoxDecoration(borderRadius: radius),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade400,
            highlightColor: Colors.grey.shade300,
            child: Container(
              height: height,
              decoration: BoxDecoration(color: Colors.grey.shade200),
            ),
          ),
        ),
        height: height,
        width: width,
        fit: fit ? BoxFit.contain : BoxFit.scaleDown,
        errorWidget: (context, url, error) {
          return Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  errorPlaceHolder ??
                      'https://www.pulsecarshalton.co.uk/wp-content/uploads/2016/08/jk-placeholder-image.jpg',
                ),
                fit: fit ? BoxFit.cover : BoxFit.scaleDown,
              ),
              borderRadius: radius,
            ),
          );
        },
      ),
    );
  }
}

class ImageCacheCircle extends StatelessWidget {
  final double height, width, topRadius, topBottom, blend;
  final String? image;
  final bool fit;

  const ImageCacheCircle(
    this.image, {
    this.height = double.maxFinite,
    this.topRadius = 10,
    this.fit = true,
    this.blend = 0,
    this.topBottom = 10,
    this.width = double.maxFinite,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CachedNetworkImage(
          height: height,
          width: width,
          placeholderFadeInDuration: Duration.zero,
          fadeInDuration: Duration.zero,
          imageUrl: image ?? "",
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: imageProvider,
                fit: fit ? BoxFit.cover : BoxFit.scaleDown,
                colorFilter: ColorFilter.mode(
                  Colors.black.withValues(alpha: blend),
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          progressIndicatorBuilder: (context, url, downloadProgress) {
            return Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.withAlpha(50),
              ),
              child: CircularProgressIndicator(
                value: downloadProgress.progress,
                strokeWidth: 2,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            );
          },
          errorWidget: (context, url, error) {
            return Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // image: DecorationImage(
                //   image: AssetImage(AppImages.hubliSplash),
                //   fit: fit ? BoxFit.cover : BoxFit.scaleDown,
                // ),
              ),
            );
          },
        ),
      ],
    );
  }
}
