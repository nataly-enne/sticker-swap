import 'package:flutter/material.dart';
import 'package:sticker_swap_client/src/core/entities/user.dart';
import 'package:sticker_swap_client/src/modules/login/config/api.dart';
import 'package:sticker_swap_client/src/modules/login/presenter/login_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/entities/auth.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  LoginState createState() => LoginState();
}

class LoginState extends ModularState<Login, LoginBloc> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool _validate = true;
  User user = Modular.get<User>();
  Auth auth = Modular.get<Auth>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log in'),
      ),
      body: SingleChildScrollView (
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(25, 60, 25, 40),
              child: Image.asset('assets/images/logo.png'),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: TextField(
                controller: _email,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(90.0),
                    ),
                    labelText: 'Email',
                    prefixIcon: const Icon(Icons.email),
                    hintText: 'email@example.com',
                    errorText: !_validate ? "Formato inválido" : null
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: TextField(
                controller: _password,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(90.0),
                    ),
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.key),
                ),
              ),
            ),
            Container(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: TextButton(
                  onPressed: () {controller.toRecoverScreen();},
                  child: const Text(
                    'Esqueceu a senha?',
                    style: TextStyle(color: Color.fromARGB(255, 31, 114, 240)),
                  ),
                ),
            ),
            ),
            Container(
                height: 80,
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                  ),
                  child: const Text('Log In'),
                  onPressed: () async{
                    setState(() {
                      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(_email.text) ? _validate = true: _validate = false;
                    });
                    var response = await controller.login(_email.text, _password.text);
                    if(!_validate || response?['token'] == null){
                      //response['msg']
                      return;
                    }
                    auth.token = response!['token'];
                    user.id = response['id'];
                    controller.verifyAuth();
                  },
                )),
            TextButton(
              onPressed: () {controller.toRegisterScreen();},
              child: Text(
                'Registre-se',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
          ],
        )
      )
    );
  }
}


class RandomNumber extends StatefulWidget {

  RandomNumber({this.token});

  String? token = "";

  @override
  RandomNumberState createState() => RandomNumberState();
}



class RandomNumberState extends State<RandomNumber>{

  TextEditingController _randomNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logado!'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              width: 500,
              height: 500,
              child: TextField(
                  decoration: const InputDecoration(border: InputBorder.none),
                  controller: _randomNumber,
                  readOnly: true
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                _randomNumber.text = (await getRandomNumber(widget.token))!;
              },
              child: const Text('Get!'),
            ),
          ],
        ),
      ),
    );
  }
}