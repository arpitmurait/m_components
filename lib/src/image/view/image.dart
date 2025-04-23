import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:m_components/m_components.dart';

class MImage extends StatelessWidget {
  final String path;
  final BorderRadiusGeometry? radius;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final Widget? placeholder;
  const MImage({super.key,
    required this.path,
    this.radius,
    this.height,
    this.width,
    this.fit,
    this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: radius ?? BorderRadius.zero,
      child: path.startsWith("assets/") ? Image.asset(path,
        width: width,
        height: height,
        fit: fit ?? BoxFit.cover,
      ) : CachedNetworkImage(
        fit: fit ?? BoxFit.cover,
        width: width ?? double.infinity,
        height: height,
        imageUrl: path,
        placeholder: (context, url) => placeholder ?? MShimmerLoader(width: width, height: height,),
      ),
    );
  }
}
