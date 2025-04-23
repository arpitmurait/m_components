import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:m_components/m_components.dart';

/// A customizable stepper widget for incrementing and decrementing values.
///
/// The stepper provides plus/minus buttons, a quantity display, and an optional
/// description label. It supports quantity limits and custom styling.
class MStepper extends StatelessWidget {
  /// Creates a stepper with increment/decrement buttons and quantity display.
  ///
  /// The [mainColor] defines the primary color of the buttons.
  /// The [quantity] sets the initial value to display.
  /// The [updateQuantity] callback is called when the value changes.
  /// If [qtyLimit] is provided, it sets the maximum value that can be reached.
  /// The [description] is an optional label displayed alongside the stepper.
  /// If [outlined] is true, the buttons will have an outlined style.
  /// The [descriptionMaxLines] controls how many lines the description can span.
  const MStepper({
    super.key,
    required this.quantity,
    required this.updateQuantity,
    this.mainColor,
    this.qtyLimit,
    this.description,
    this.outlined,
    this.descriptionMaxLines,
    this.height,
    this.width,
    this.fontSize,
  });

  /// The current quantity value displayed in the stepper.
  final num quantity;

  /// Callback function triggered when the quantity changes.
  final Function(num) updateQuantity;

  /// The primary color used for the stepper buttons.
  final Color? mainColor;

  /// Optional upper limit for the quantity value.
  /// If provided, the value cannot exceed this limit.
  final num? qtyLimit;

  /// Optional description label displayed alongside the stepper.
  /// Will be displayed in uppercase.
  final String? description;

  /// When true, the buttons will have an outlined style instead of filled.
  /// Defaults to false if not specified.
  final bool? outlined;

  /// The maximum number of lines the description can span.
  /// Defaults to 1 if not specified.
  final int? descriptionMaxLines;
  final double? height;
  final double? width;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    Color color = mainColor ?? MWidgetConfig().mainColor;
    return SizedBox(
      height: height,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (description != null) buildDescription(context),
          buildQuantityButton(context, decrement: true, color: color),
          Expanded(flex: 3, child: buildText(context)),
          buildQuantityButton(context, decrement: false, color: color),
        ],
      ),
    );
  }

  Widget buildQuantityButton(
    BuildContext context, {
    required bool decrement,
    required Color color,
  }) {
    return Expanded(
      flex: 2,
      child: MGestureDetector(
        onTap: () {
          if (decrement == false) {
            if (qtyLimit != null && quantity < qtyLimit!) {
              updateQuantity(
                quantity + 1 <= qtyLimit! ? quantity + 1 : qtyLimit!,
              );
            } else {
              updateQuantity(
                quantity + 1 <= qtyLimit! ? quantity + 1 : qtyLimit!,
              );
            }
          } else {
            if (quantity > 0) {
              updateQuantity(quantity - 1 > 0 ? quantity - 1 : 0);
            }
          }
        },
        onLongPress: () {
          if (decrement == true) {
            updateQuantity(0);
          } else {
            if (qtyLimit != null) {
              updateQuantity(qtyLimit!);
            }
          }
        },
        child: buildButton(
          context,
          decrement ? 0 : qtyLimit,
          !decrement,
          color,
        ),
      ),
    );
  }

  Widget buildButton(
    BuildContext context,
    num? limit,
    bool isAddButton,
    Color color,
  ) {
     final isDisabled = quantity == limit;
    final buttonColor =
        outlined == true
            ? Colors.white.withValues(alpha: isDisabled ? 0.3 : 1.0)
            : color.withValues(alpha: isDisabled ? 0.3 : 1.0);
    final textColor =
        outlined == true
            ? color.withValues(alpha: isDisabled ? 0.3 : 1.0)
            : Colors.white.withValues(alpha: isDisabled ? 0.3 : 1.0);
    return Container(
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(!isAddButton ? 8 : 0),
          bottomLeft: Radius.circular(!isAddButton ? 8 : 0),
          topRight: Radius.circular(isAddButton ? 8 : 0),
          bottomRight: Radius.circular(isAddButton ? 8 : 0),
        ),
        border: Border.all(
          strokeAlign: BorderSide.strokeAlignInside,
          width: 2.5,
          color:
              outlined == true
                  ? (isDisabled ? color.withValues(alpha: 0.3) : color)
                  : Colors.transparent,
        ),
      ),
      alignment: Alignment.center,
      child: MText(
        isAddButton ? '+' : '-',
        fontWeight: FontWeight.bold,
        color: textColor,
        fontSize: fontSize,
      ),
    );
  }

  Widget buildText(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: MColors.darkGrey, width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.center,
          child: MText('$quantity', fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
    );
  }

  Widget buildDescription(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * (kIsWeb == true ? 0.1 : 0.26),
      child: Padding(
        padding: const EdgeInsets.only(right: 5),
        child: MText(
          description!.toUpperCase(),
          color: MColors.darkGrey,
          fontSize: 14,
          maxLines: descriptionMaxLines ?? 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
