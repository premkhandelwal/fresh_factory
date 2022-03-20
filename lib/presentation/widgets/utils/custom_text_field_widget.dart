import 'package:flutter/material.dart';
import 'package:fresh/presentation/utils/custom_header_widget.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final String label;
  final String hint;
  final Widget suffixWidget;
  CustomTextFieldWidget({
    required this.label,
    required this.hint,
    required this.suffixWidget,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomHeaderWidget(
          title: label,
          fontSize: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Row(
            children: [
              Flexible(
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: hint, border: const OutlineInputBorder()),
                ),
              ),
              suffixWidget
            ],
          ),
        ),
      ],
    );
  }
}
