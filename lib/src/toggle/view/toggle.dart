import 'package:flutter/material.dart';
import 'package:m_components/m_components.dart';

/// A customizable toggle switch widget with a description label.
///
/// The toggle can be set as read-only and its colors can be customized.
class MToggle extends StatefulWidget {
  /// Creates a toggle switch with a description label.
  ///
  /// The [updateFunc] is called when the toggle value changes.
  /// The [toggleValue] represents the initial state of the toggle.
  /// The [description] parameter is required and appears next to the toggle.
  /// If [readOnly] is true, the toggle cannot be interacted with.
  /// The [mainColor] specifies the primary color of the toggle when active.
  const MToggle({
    super.key,
    required this.updateFunc,
    required this.toggleValue,
    this.description,
    this.readOnly,
    this.mainColor,
    this.inactiveColor,
  });

  /// Callback function triggered when the toggle value changes.
  final Function(bool value) updateFunc;

  /// The initial state of the toggle.
  final bool toggleValue;

  /// The label text displayed next to the toggle.
  /// Will be displayed in uppercase.
  final String? description;

  /// When true, the toggle cannot be interacted with.
  /// Defaults to false if not specified.
  final bool? readOnly;

  /// The color used for the active state of the toggle.
  /// Defaults to blue if not specified.
  final Color? mainColor;
  final Color? inactiveColor;

  @override
  State<MToggle> createState() => _RPToggleState();
}

class _RPToggleState extends State<MToggle> {
  bool value = false;
  Color color = MWidgetConfig().mainColor;

  @override
  void initState() {
    value = widget.toggleValue;
    if (widget.mainColor != null) {
      color = widget.mainColor!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if ((widget.description ?? '').isNotEmpty) buildDescription(),
          buildSwitch(context, color),
        ],
      ),
    );
  }

  Widget buildDescription() {
    return Expanded(
      child: MText(widget.description!.toUpperCase(), fontSize: 14),
    );
  }

  Widget buildSwitch(BuildContext context, Color color) {
    return IgnorePointer(
      ignoring: widget.readOnly ?? false,
      child: Switch(
        activeColor: color.withValues(
          alpha: widget.readOnly == true ? 0.5 : 1.0,
        ),
        activeTrackColor: color.withValues(
          alpha: widget.readOnly == true ? 0.2 : 0.5,
        ),
        inactiveThumbColor: widget.inactiveColor ?? MColors.darkGrey,
        inactiveTrackColor: widget.inactiveColor ?? MColors.darkGrey.withValues(alpha: 0.5),
        trackOutlineColor: WidgetStateColor.resolveWith((states) {
          return Colors.transparent;
        }),
        splashRadius: 50.0,
        value: value,
        onChanged: (newValue) {
          widget.updateFunc(newValue);
          setState(() {
            value = newValue;
          });
        },
      ),
    );
  }
}
