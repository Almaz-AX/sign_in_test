import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sign_in_test/navigation/main_navigation.dart';

class SmsCodeInputPage extends StatelessWidget {
  const SmsCodeInputPage({super.key});

  @override
  Widget build(BuildContext context) {
    final phone = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        leading: SafeArea(
            child: IconButton(
          color: Theme.of(context).colorScheme.secondary,
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 45,
          ),
          onPressed: () => Navigator.of(context).pop(),
        )),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const StepSecond(),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Подтверждение',
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 280,
              child: Text(
                'Введите код, который мы отправили в SMS на $phone',
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const _InputForm(),
            const SizedBox(
              height: 70,
            ),
            const _TextButton()
          ],
        ),
      ),
    );
  }
}

class _InputForm extends StatefulWidget {
  const _InputForm({super.key});

  @override
  State<_InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<_InputForm> {
  String smsCode = '12345';
  final Duration duration = const Duration(seconds: 60);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 20),
        child: Column(
          children: [
            TextFormField(
                onChanged: (value) => setState(() {
                      if (value.length == 5 && value == smsCode) {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            MainNavigationRouteNames.myProfile,
                            (route) => false);
                      }
                    }),
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 34, letterSpacing: 34),
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(5)
                ],
                decoration: const InputDecoration(border: InputBorder.none)),
            UnderlineDottedBorder(smsCodeLenght: smsCode.length)
          ],
        ));
  }
}

class UnderlineDottedBorder extends StatelessWidget {
  const UnderlineDottedBorder({
    super.key,
    required this.smsCodeLenght,
  });

  final int smsCodeLenght;

  @override
  Widget build(BuildContext context) {
    final container = Container(
        margin: const EdgeInsets.symmetric(horizontal: 7),
        height: 2,
        width: 40,
        color: Colors.grey[500]);
    return Row(
      children: List.generate(smsCodeLenght, (index) => container),
    );
  }
}

class _TextButton extends StatefulWidget {
  const _TextButton({
    super.key,
  });

  @override
  State<_TextButton> createState() => _TextButtonState();
}

class _TextButtonState extends State<_TextButton> {
  late Timer _timer;
  int _remainingTime = 60;
  @override
  void initState() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() => _remainingTime--);
      } else {
        _timer.cancel();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: _remainingTime == 0 ? () {} : null,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
          child: _remainingTime == 0
              ? Text(
                  'Отправить код еще раз',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                )
              : Text('$_remainingTime сек до повтора отправки кода'),
        ));
  }
}

class StepSecond extends StatelessWidget {
  const StepSecond({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.green, width: 1),
                color: Colors.white,
                shape: BoxShape.circle),
          ),
          Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              Container(
                height: 2,
                width: 50,
                color: Theme.of(context).colorScheme.secondary,
              ),
              Icon(
                Icons.check,
                color: Theme.of(context).colorScheme.secondary,
              )
            ],
          ),
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                shape: BoxShape.circle),
            child: const Center(child: Text('2')),
          ),
          Container(
            height: 2,
            width: 50,
            color: Theme.of(context).colorScheme.secondary,
          ),
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                shape: BoxShape.circle),
            child: const Center(child: Text('3')),
          )
        ],
      ),
    );
  }
}
