import 'package:flutter/material.dart';

class NameEditingPage extends StatefulWidget {
  const NameEditingPage({super.key});

  @override
  State<NameEditingPage> createState() => _NameEditingPageState();
}

class _NameEditingPageState extends State<NameEditingPage> {
  var name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          elevation: 0.5,
          shadowColor: Colors.black,
          title: const Text('Ваше Имя'),
          leading: TextButton(
              onPressed: () {
                Navigator.of(context).pop(name);
              },
              child: const Row(children: [
                Icon(Icons.arrow_back_ios_new, color: Colors.blue),
                SizedBox(
                  width: 5,
                ),
                Text('Аккаунт',
                    style: TextStyle(
                      color: Colors.blue,
                    ))
              ])),
          leadingWidth: MediaQuery.of(context).size.width / 2.7,
        ),
        body: Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
                textCapitalization: TextCapitalization.words,
                onChanged: (value) => name = value,
                decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                    hintStyle: TextStyle(
                        color: Colors.grey[400], fontWeight: FontWeight.normal),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Ваше Имя',
                    border: const OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0, style: BorderStyle.none),
                        borderRadius:
                            BorderRadius.all(Radius.circular(15)))))));
  }
}
