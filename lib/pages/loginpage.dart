import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = '';
  bool changebutton = false;
  final _formKey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changebutton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, '/home');
      setState(() {
        changebutton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.theme.canvasColor,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset('assets/images/hello.png'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Welcome $name",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(children: [
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'username cannot be empity';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter Username',
                      labelText: 'Username',
                    ),
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'password cannot be empty';
                      } else if (value.length < 5) {
                        return 'password is too short';
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Enter Password',
                      labelText: 'Password',
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () => moveToHome(context),
                    child: AnimatedContainer(
                      alignment: Alignment.center,

                      decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius:
                              BorderRadius.circular(changebutton ? 50 : 10)),
                      height: 50.0,
                      width: changebutton ? 50 : 130.0,
                      duration: Duration(seconds: 1),
                      child: changebutton
                          ? Icon(
                              Icons.done,
                              color: Colors.white,
                            )
                          : Text('Login',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                      // child: ElevatedButton(
                      //   style: TextButton.styleFrom(minimumSize: Size(150, 50)),
                      //   onPressed: () {
                      //     Navigator.pushNamed(context, '/home');
                      //   },
                      //   child: Text('Login'),
                      // ),
                    ),
                  )
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
