import 'package:flutter/material.dart';
import 'package:m_components/m_components.dart';

// ignore: must_be_immutable
class MItemSelector extends StatelessWidget {
  MItemSelector({
    super.key,
    this.label,
    this.fontSize,
    required this.selectedValue,
    required this.values,
    required this.updateValue,
  });

  final String? label;
  final double? fontSize;
  final Iterable<dynamic> values;
  final Function(dynamic element) updateValue;

  dynamic selectedValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child:
          values.isEmpty
              ? buildNoElements()
              : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (var element in values)
                        buildElement(context, element),
                    ],
                  ),
                ),
              ),
    );
  }

  Widget buildNoElements() {
    return Center(
      child: MPlaceholder(
        icon: Icons.search_off,
        placeholderText: MLocalization.instance.translate('No element found'),
      ),
    );
  }

  Widget buildElement(BuildContext context, dynamic element) {
    return MGestureDetector(
      onTap: () {
        if (element != null) {
          selectedValue = element!;
          updateValue(element);
          Navigator.of(context).pop();
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MText(
                element == null ? '-' : '$element',
                fontSize: fontSize,
                color: Colors.black,
              ),
              if (values.last != element)
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: MDivider(height: 1),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
