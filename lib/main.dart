import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'api.dart';

void main() async {
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginDemo()
    );
  }
}

class LoginDemo extends StatefulWidget {
  @override
  LoginDemoState createState() => LoginDemoState();
}

class LoginDemoState extends State<LoginDemo> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool _validate = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              title: Text('Login Screen'),
            ),
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 70),
                    child: FlutterLogo(
                      size: 40,
                    ),
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
                        labelText: 'Password'
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
                        onPressed: () {
                          setState(() {
                            RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(_email.text) ? _validate = true: _validate = false;
                          });
                          login(_email, _password);
                          if(!_validate){
                            return;
                          }

                          Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondRoute()));
                        },
                      )),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),
                ],
              ),
            ));
    
  }

}


class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logado!'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Voltar!'),
            ),
          ],
        ),
      ),
    );
  }
}
