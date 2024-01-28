import 'package:flutter/material.dart';
import 'package:sign_in_test/features/main_screen/presentation/pages/last_name_editing_page.dart';
import 'package:sign_in_test/features/main_screen/presentation/pages/name_editing_page.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        shadowColor: Colors.black,
        title: const Center(child: Text('Аккаунт')),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Avatar(),
              const SizedBox(
                height: 8,
              ),
              Text(
                'apollo@gmail.com',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 12),
              ),
              const SizedBox(
                height: 24,
              ),
              const FirstNameWidget(),
              const Divider(
                height: 0.2,
              ),
              const LastNameWidget(),
              const Divider(
                height: 0.2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LastNameWidget extends StatefulWidget {
  const LastNameWidget({
    super.key,
  });

  @override
  State<LastNameWidget> createState() => _LastNameWidgetState();
}

class _LastNameWidgetState extends State<LastNameWidget> {
  String lastName = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          const SizedBox(
            width: 8,
          ),
          if (lastName.isEmpty) const Text('Фамилия') else Text(lastName),
          const Expanded(
            child: SizedBox(
              height: 5,
            ),
          ),
          TextButton(
            onPressed: () async {
              lastName = await Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const LastNameEditingPage())) as String;
              setState(() {});
            },
            child: Row(children: [
              Text(
                'Настроить',
                style: TextStyle(
                    color: Colors.grey[300],
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                width: 8,
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.grey[300],
              )
            ]),
          )
        ],
      ),
    );
  }
}

class FirstNameWidget extends StatefulWidget {
  const FirstNameWidget({
    super.key,
  });

  @override
  State<FirstNameWidget> createState() => _FirstNameWidgetState();
}

class _FirstNameWidgetState extends State<FirstNameWidget> {
  String name = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12))),
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          const SizedBox(
            width: 8,
          ),
          if (name.isEmpty) const Text('Имя') else Text(name),
          const Expanded(
            child: SizedBox(
              height: 5,
            ),
          ),
          TextButton(
            onPressed: () async {
              name = await Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const NameEditingPage())) as String;
              setState(() {});
            },
            child: Row(children: [
              Text(
                'Настроить',
                style: TextStyle(
                    color: Colors.grey[300],
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                width: 8,
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.grey[300],
              )
            ]),
          )
        ],
      ),
    );
  }
}

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90,
      height: 90,
      child: Stack(
        children: [
          CircleAvatar(
            radius: 37,
            backgroundColor: Theme.of(context).colorScheme.secondary,
            child: const Icon(
              Icons.person,
              size: 70,
              color: Colors.blue,
            ),
          ),
          Positioned(
              left: 40,
              top: 40,
              child: IconButton(
                  splashRadius: 15,
                  color: Colors.blue,
                  iconSize: 37,
                  style: ButtonStyle(
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(2)),
                      backgroundColor: MaterialStateProperty.all(Colors.white)),
                  onPressed: () {
                    showBottomSheet(
                        backgroundColor: Colors.white,
                        elevation: 5,
                        context: context,
                        builder: (context) => const BottomDialogWidget());
                  },
                  icon: const Icon(
                    Icons.more_horiz,
                  ))),
        ],
      ),
    );
  }
}

class BottomDialogWidget extends StatelessWidget {
  const BottomDialogWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12))),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Выберите фото',
                  style: TextStyle(color: Colors.grey[600], fontSize: 13),
                ),
              ),
              const Divider(
                height: 0.2,
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Камера',
                        style: TextStyle(color: Colors.blue, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(
                height: 0.2,
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Галерея Фото',
                        style: TextStyle(color: Colors.blue, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12))),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Закрыть',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
