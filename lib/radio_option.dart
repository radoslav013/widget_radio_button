import 'package:flutter/material.dart';

const borderColour = Color(0xFF0392A4); // TODO: global
const selectedColour = Color(0xFFC3FF18); // TODO:  global
const deselectedColour = Color(0xFF00282D); // TODO: global
const backgroundOptionColour = Color(0xFF113a3f); // TODO: global

class RadioOption<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final String label;
  String? text;
  final ValueChanged<T?> onChanged;

  RadioOption({
    required this.value,
    required this.groupValue,
    required this.label,
    this.text,
    required this.onChanged,
  }) : super(key: ObjectKey(value));

  Widget _buildLabel() {
    final bool isSelected = value == groupValue;

    return Container(
      width: 32,
      height: 32,
      decoration: ShapeDecoration(
        shape: const CircleBorder(
          side: BorderSide(
            color: borderColour,
          ),
        ),
        color: isSelected ? selectedColour : deselectedColour,
      ),
    );
  }

  List<Text> _buildTextChildren() {
    var textChildren = [
      Text(
        label,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            height: 1.5),
      ),
    ];
    if (text != null) {
      textChildren.add(Text(
        text ?? '',
        style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.normal,
            height: 1.5),
      ));
    }
    return textChildren;
  }

  Widget _buildText() {
    return Container(
      margin: const EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _buildTextChildren(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onChanged(value),
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(backgroundOptionColour),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            _buildLabel(),
            _buildText(),
          ],
        ),
      ),
    );
  }
}
