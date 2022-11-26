import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  void initState() {
    super.initState();
    _email = TextEditingController(text: 'enne@gmail.com');
    _password = TextEditingController(text: '****************');
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Configurações'),
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: buildProfileImage(),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextButton(
                      child: const Text(
                        'Mudar foto de perfil',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: TextField(
                      controller: _email,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.edit),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(90.0),
                        ),
                        labelText: 'Email',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: TextField(
                      controller: _password,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.remove_red_eye),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(90.0),
                        ),
                        labelText: 'Password',
                      ),
                    ),
                  ),
                  Container(
                    height: 80,
                    margin: const EdgeInsets.only(top: 250),
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                      ),
                      child: const Text('Sair'),
                      onPressed: () async {
                        _showLogOutModalDialog(context);
                      },
                    )
                  ),
                ],
              ),
            )));
  }
}

_showLogOutModalDialog(context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              content: RichText(
                textAlign: TextAlign.justify,
                text: const TextSpan(
                    text:
                        "Você tem certeza que deseja sair do Sticker Swap?",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Colors.black,
                        wordSpacing: 1)),
              ),
              actions: [
                Container(
                      height: 80,
                      padding: const EdgeInsets.all(20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50),
                        ),
                        child: const Text('Sim'),
                        onPressed: () async {
                          Navigator.pushNamed(context, '/login');
                        },
                      ))
              ],
        );
      });
}

Widget buildProfileImage() => const CircleAvatar(
      radius: 55,
      backgroundImage: AssetImage('assets/images/profile_picture.png'),
    );
