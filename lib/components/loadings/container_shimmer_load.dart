import 'package:flutter/material.dart';
import 'package:ipot/components/loadings/shimmer.dart';

class ContainerShimmerLoad extends StatelessWidget {
  final double width;
  final double height;
  final double? radius;

  const ContainerShimmerLoad({
    super.key,
    this.width = 0,
    this.height = 0,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(radius ?? 10);

    return Shimmer(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: borderRadius,
        ),
      ),
    );
  }
}
