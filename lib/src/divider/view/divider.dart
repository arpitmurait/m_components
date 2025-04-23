import 'package:flutter/material.dart';
import 'package:m_components/m_components.dart';

class MDivider extends StatelessWidget {
  const MDivider({super.key, this.thickness, this.height});

  final double? thickness;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: thickness ?? 1,
      height: height,
      color: MColors.darkGrey,
    );
  }
}
