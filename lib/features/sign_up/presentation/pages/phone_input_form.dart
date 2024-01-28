import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sign_in_test/navigation/main_navigation.dart';

class PhoneInputForm extends StatefulWidget {
  const PhoneInputForm({super.key});

  @override
  State<PhoneInputForm> createState() => _PhoneInputFormState();
}

class _PhoneInputFormState extends State<PhoneInputForm> {
  bool buttonActivity = false;
  String phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextFormField(
            onChanged: (value) => setState(() {
              if (value.length == 18) {
                buttonActivity = true;
                phoneNumber = value;
              } else {
                buttonActivity = false;
              }
            }),
            initialValue: '+7 (',
            inputFormatters: [_PhoneInputFormatter()],
            keyboardType: TextInputType.phone,
            cursorColor: Theme.of(context).colorScheme.secondary,
            decoration: InputDecoration(
                focusColor: Theme.of(context).primaryColor,
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)))),
          ),
        ),
        const SizedBox(
          height: 80,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                disabledBackgroundColor: Colors.grey,
                backgroundColor: Theme.of(context).colorScheme.primary),
            onPressed: buttonActivity
                ? () {
                    Navigator.of(context).pushNamed(
                        MainNavigationRouteNames.smsCodeInput,
                        arguments: phoneNumber);
                  }
                : null,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
              child: Text(
                'Отправить смс-код',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ))
      ],
    );
  }
}

class _PhoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > 18) {
      return TextEditingValue(text: oldValue.text);
    }
    if (newValue.text.length <= 4) {
      return const TextEditingValue(text: '+7 (');
    }
    final List<String> text = [];
    final initialSymbolsCount = newValue.selection
        .textBefore(newValue.text)
        .replaceAll(RegExp(r'[\d]'), '')
        .length;
    int cursorPosition = newValue.selection.start - initialSymbolsCount;
    final digitsList = newValue.text.replaceAll(RegExp(r'[^\d]'), '').split('');
    if (oldValue.text.length > newValue.text.length &&
        oldValue.selection.textInside(oldValue.text) == ' ') {
      digitsList.removeAt(cursorPosition - 1);
      cursorPosition -= 2;
    }
    if (digitsList.isNotEmpty) digitsList.removeAt(0);
    for (int index = 0; index < digitsList.length; index++) {
      if (index == 0) {
        text.add('+7 (');

        cursorPosition += 3;
      }
      if (index == 3) {
        text.add(') ');
        text.add(digitsList[index]);
        if (index <= cursorPosition) cursorPosition += 2;
      } else if (index == 6 || index == 8 || index == 10) {
        text.add(' ');
        text.add(digitsList[index]);
        if (index <= cursorPosition) cursorPosition += 1;
      } else {
        text.add(digitsList[index]);
      }
    }

    return TextEditingValue(
        text: text.join(),
        selection: TextSelection.collapsed(offset: cursorPosition));
  }
}
