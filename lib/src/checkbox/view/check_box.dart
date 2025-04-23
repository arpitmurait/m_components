import 'package:flutter/material.dart';
import 'package:m_components/m_components.dart' show MWidgetConfig;

class MCheckBox extends StatelessWidget {
  const MCheckBox({super.key,
    this.initVal = false,
    required this.onChnage,
    this.scale,
    this.fgColor,
    this.bgColor,
    this.borderColor,
    this.activeColor,
    this.shape,
    this.radius,
  });

  final bool initVal;
  final Function(bool) onChnage;
  final double? scale;
  final double? radius;
  final Color? bgColor;
  final Color? fgColor;
  final Color? borderColor;
  final Color? activeColor;
  final OutlinedBorder? shape;

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> value = ValueNotifier<bool>(initVal);
    return Transform.scale(
      scale: scale ?? 1.3,
      child: ValueListenableBuilder(
        valueListenable: value,
        builder: (context, val, child) => Checkbox(
          value: val,
          onChanged: (val) {
            value.value = val ?? false;
            onChnage(val ?? value.value);
          },
          splashRadius: 20,
          visualDensity: VisualDensity.compact,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          // shape: shape ?? RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius ?? 5)),
          side: BorderSide(color:  borderColor ??  MWidgetConfig().mainColor, width: 1),
          // fillColor: MaterialStateProperty.all(bgColor ?? CustomColors.buttonColor),
          checkColor: fgColor,
          activeColor: activeColor ?? MWidgetConfig().mainColor,
        ),),
    );
  }
}
