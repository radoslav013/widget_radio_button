import 'package:flutter/material.dart';
import 'package:widget_radio_button/radio_option.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Shopping App',
    home: RadioButtons(),
  ));
}

const backgroundColour = Color(0xFF003339); // TODO: global

// TODO: coming from CMS
const data = [
  {'id': 1, 'label': 'Option 1', 'text': 'Option 1 text'},
  {'id': 3, 'label': 'option 2', 'text': 'Option 2 text'},
];

class RadioButtons extends StatefulWidget {
  const RadioButtons({Key? key}) : super(key: key);

  @override
  State createState() => _RadioButtonsState();
}

class _RadioButtonsState extends State<RadioButtons> {
  String? _groupValue;

  ValueChanged<String?> _valueChangedHandler() {
    return (value) => setState(() => _groupValue = value!);
  }

  Widget _buildOptions(BuildContext context) {
    return data.length > 2
        ? Wrap(
            spacing: 20,
            runSpacing: 20,
            children: data
                .map(
                  (e) => Container(
                    width: 300,
                    child: RadioOption(
                      value: e['id'].toString(),
                      groupValue: _groupValue,
                      label: e['label'].toString(),
                      text: e['text'].toString(),
                      onChanged: _valueChangedHandler(),
                    ),
                  ),
                )
                .toList())
        : Column(
            children: data
                .map(
                  (e) => Container(
                    width: 300,
                    margin: const EdgeInsets.only(top: 20),
                    child: RadioOption(
                      value: e['id'].toString(),
                      groupValue: _groupValue,
                      label: e['label'].toString(),
                      onChanged: _valueChangedHandler(),
                    ),
                  ),
                )
                .toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColour,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Radio Buttons'),
        backgroundColor: Colors.black,
      ),
      body: _buildOptions(context),
    );
  }
}
