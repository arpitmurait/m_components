import 'package:flutter/material.dart';

import 'shimmer_card.dart';

class MShimmerLoader extends StatelessWidget {
  final double? width;
  final double? height;
  final double? radius;
  final Color? shimmerColor;
  final Color? backgroundColor;
  const MShimmerLoader({super.key,
    this.width,
    this.height,
    this.radius,
    this.shimmerColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return MShimmerCard(
      width: width ?? 200,
      height: height ?? 250,
      borderRadius: radius ?? 10,
      beginAlignment: Alignment.topLeft,
      endAlignment: Alignment.bottomRight,
      backgroundColor: backgroundColor ?? Colors.white.withValues(alpha: 0.4),
      shimmerColor: shimmerColor ?? Colors.grey,
    );
  }
}

class MGridItemShimmer extends StatelessWidget {
  final int count;
  final int crossCount;
  final double spacing;
  final ScrollPhysics? physics;
  const MGridItemShimmer({super.key,
    this.count = 4,
    this.crossCount = 2,
    this.spacing = 15,
    this.physics,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossCount,
        crossAxisSpacing: spacing,
        mainAxisSpacing: spacing,
      ),
      shrinkWrap: true,
      physics: physics,
      padding: EdgeInsets.zero,
      itemCount: count,
      itemBuilder: (context, index) {
        return MShimmerLoader();
      },
    );
  }
}

class MListItemShimmer extends StatelessWidget {
  final int count;
  final double height;
  final ScrollPhysics? physics;
  const MListItemShimmer({super.key,
    this.count = 8,
    this.height = 70,
    this.physics,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: count,
      shrinkWrap: true,
      physics: physics,
      padding: EdgeInsets.only(bottom: 20),
      itemBuilder: (context, index) {
        return MShimmerLoader(height: height);
      },
      separatorBuilder: (context, index) => SizedBox(height: 10),
    );
  }
}

class MListItemHorizontalShimmer extends StatelessWidget {
  final int count;
  final double height;
  final double width;
  final ScrollPhysics? physics;
  const MListItemHorizontalShimmer({super.key,
    this.count = 8,
    this.height = 150,
    this.width = 110,
    this.physics,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: count,
      shrinkWrap: true,
      physics: physics,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return MShimmerLoader(height: height, width: width,);
      },
      separatorBuilder: (context, index) => SizedBox(width: 10),
    );
  }
}