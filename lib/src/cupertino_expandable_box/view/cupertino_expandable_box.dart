import 'package:flutter/material.dart';
import 'package:m_components/m_components.dart';

/// A customizable expandable box widget with Cupertino styling.
///
/// This widget provides a collapsible container with a title bar that can be tapped
/// to expand or collapse the content. It uses the MCupertinoBox for styling and
/// includes an indicator icon that changes based on the expanded state.
class MCupertinoExpandableBox extends StatefulWidget {
  /// Creates an expandable box with Cupertino styling.
  ///
  /// The [title] is displayed in the header of the box and is always visible.
  /// The [child] widget is displayed when the box is expanded.
  /// The [onExpand] callback is triggered when the expansion state changes.
  /// The [mainColor] defines the accent color used for the title and icon.
  const MCupertinoExpandableBox({
    super.key,
    required this.title,
    required this.child,
    this.onExpand,
    this.mainColor,
  });

  /// The title text displayed in the header of the expandable box.
  final String title;

  /// The widget to display when the box is expanded.
  final Widget child;

  /// Optional callback function triggered when the expansion state changes.
  final Function()? onExpand;

  /// The accent color used for the title text and indicator icon.
  /// If not provided, uses the main color from MWidgetConfig.
  final Color? mainColor;

  @override
  State<MCupertinoExpandableBox> createState() =>
      _MCupertinoExpandableBoxState();
}

class _MCupertinoExpandableBoxState extends State<MCupertinoExpandableBox> {
  /// Tracks whether the box is currently expanded.
  bool expand = false;

  @override
  Widget build(BuildContext context) {
    // Use provided mainColor or fall back to the default from MWidgetConfig
    Color color = widget.mainColor ?? MWidgetConfig().mainColor;

    return Column(
      children: [
        // Header section with tap functionality
        MGestureDetector(
          onTap: () {
            setState(() {
              // Toggle expansion state
              expand = !expand;
              // Call the onExpand callback if provided
              if (widget.onExpand != null) {
                widget.onExpand!();
              }
            });
          },
          child: MCupertinoBox(
            isFirst: true,
            // The header is the last element when collapsed
            isLast: !expand,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                // Display different icons based on expansion state
                Icon(
                  expand == true
                      ? Icons.keyboard_arrow_down_rounded
                      : Icons.chevron_right,
                  color: color,
                ),
                // Title text with consistent styling
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: MText(
                    widget.title,
                    color: color,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
        // Conditionally show the content when expanded
        if (expand == true) MCupertinoBox(isLast: true, child: widget.child),
      ],
    );
  }
}
