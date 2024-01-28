import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'phone_input_form.dart';

class PhoneInputPage extends StatelessWidget {
  const PhoneInputPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SafeArea(
            child: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 45,
          ),
          onPressed: null,
        )),
      ),
      body: const SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _StepFirst(),
            SizedBox(
              height: 40,
            ),
            Text(
              'Регистрация',
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 200,
              child: Text(
                'Введите номер телефона для регистрации',
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            PhoneInputForm(),
            SizedBox(
              height: 8,
            ),
            SizedBox(
                width: 250,
                child: Wrap(
                  children: [
                    Text(
                      'Нажимая на данную кнопкуб вы даете согласие на обработку персональных данных',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(167, 117, 117, 115)),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class _StepFirst extends StatelessWidget {
  const _StepFirst({
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
                color: Theme.of(context).colorScheme.primary,
                shape: BoxShape.circle),
            child: const Center(child: Text('1')),
          ),
          Container(
            height: 2,
            width: 50,
            color: Colors.grey[200],
          ),
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
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
