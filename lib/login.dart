import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<String> attemptLogin(String username, String password) async {
    var res = await http
        .post("https://no.usehurrier.com/app/rooster/web/login", body: {
      "user": {
        "email": nameController.text,
        "password": passwordController.text,
      }
    });
    if (res.statusCode == 201) return res.body;
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dora info now'),
        backgroundColor: Color.fromARGB(255, 248, 12, 238),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Text(
                'Foodora Order Info',
                style: TextStyle(
                  color: Color.fromARGB(255, 135, 7, 192),
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Roadrunner username'),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Roadrunner password'),
              ),
            ),
            Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: RaisedButton(
                  textColor: Color.fromARGB(255, 248, 248, 252),
                  color: Color.fromARGB(255, 54, 38, 251),
                  child: Text('Login to Roadrunner to generate key'),
                  onPressed: () {
                    print(nameController.text);
                    print(passwordController.text);
                  },
                ))
          ],
        ),
      ),
    );
  }
}
