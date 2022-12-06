import 'package:flutter/material.dart';
import 'package:sticker_swap_client/src/modules/login/config/api.dart';
import 'package:sticker_swap_client/src/modules/register/presenter/register_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends ModularState<RegisterScreen, RegisterBloc> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _password_confirm = TextEditingController();
  bool _validate = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar-se'),
      ),
      body: SingleChildScrollView(
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
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: TextField(
                controller: _password_confirm,
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
                height: 80,
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                  ),
                  child: const Text('Cadastre-se'),
                  onPressed: () async{
                    setState(() {
                      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(_email.text) ? _validate = true: _validate = false;
                    });

                    var response = await controller.register(_email.text, _password.text);
                    if( response?['status'] != null){
                      //response!['status']
                      return;
                    }
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => RandomNumber(token: jwt)));
                    controller.setUpAlbum(response!['id']);
                    controller.verifyAuth();
                  },
                )),
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

  final TextEditingController _randomNumber = TextEditingController();

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