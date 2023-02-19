import 'package:aurora/screens/auth/passw_res.dart';
import 'package:aurora/screens/auth/register_screen.dart';
import 'package:aurora/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:aurora/widgets.dart';

class LogScreen extends StatefulWidget {
  static const String id = 'log_screen';

  @override
  LogScreenState createState() => LogScreenState();
}

class LogScreenState extends State<LogScreen> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFCFE3E3),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(50, 100, 50, 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset(
                height: 100,
                width: 100,
                'images/logo.png',
              ),
              const SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      'Sign in',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontFamily: 'RobotoMono',
                          fontSize: 15,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  const SizedBox(width: 5),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return RegScreen();
                          },
                        ),
                      );
                    },
                    child: const Text(
                      ' Sign up',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontFamily: 'RobotoMono',
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(width: 2),
                ],
              ),
              TextField(
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                enableSuggestions: false,
                autocorrect: false,
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 18, horizontal: 4),
                  hintText: "E-mail",
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    size: 28,
                    color: Color.fromRGBO(49, 62, 64, 1),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                    borderSide: BorderSide(width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                    borderSide: BorderSide(width: 1, color: Colors.black54),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _password,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 18, horizontal: 4),
                  hintText: "Password",
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(
                    Icons.lock,
                    size: 28,
                    color: Color.fromRGBO(49, 62, 64, 1),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                    borderSide: BorderSide(width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                    borderSide: BorderSide(width: 1, color: Colors.black54),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: [
                      Transform.scale(
                        scale: 1,
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: Checkbox(
                            activeColor: const Color(0xff00C8E8),
                            splashRadius: 25,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        'Remember me',
                        style:
                            TextStyle(fontFamily: 'RobotoMono', fontSize: 13),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return PasswrScreen();
                          },
                        ),
                      );
                    },
                    child: const Text(
                      'Forgot Password?',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: 'RobotoMono',
                          fontSize: 13,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              PAsyncButton(
                colour: Colors.black,
                title: const Text(
                  'Sign-In',
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.black,
                  ),
                ),
                paddings:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 85),
                onPress: () async {
                  FocusManager.instance.primaryFocus?.unfocus();
                  await AuthService()
                      .emailSignIn(_email.text, _password.text, context);
                },
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Don\'t have an account yet?  ',
                      style: TextStyle(fontFamily: 'RobotoMono', fontSize: 12),
                      textAlign: TextAlign.left),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return RegScreen();
                          },
                        ),
                      );
                    },
                    child: const Text(
                      'Sign up now ',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontFamily: 'RobotoMono',
                          fontSize: 12,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: const <Widget>[
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                      thickness: 1.5,
                    ),
                  ),
                  Text(
                    "      or login      ",
                    style: TextStyle(fontFamily: 'RobotoMono', fontSize: 15),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                      thickness: 1.5,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 60,
                    height: 45,
                    child: Material(
                      elevation: 3.0,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(color: Colors.black, width: 1.5),
                      ),
                      child: MaterialButton(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                        onPressed: () {},
                        height: 50.0,
                        child: Image.asset('images/google logo.png'),
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
                  SizedBox(
                    width: 60,
                    height: 45,
                    child: Material(
                      elevation: 3.0,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(color: Colors.black, width: 1.5),
                      ),
                      child: MaterialButton(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                        ),
                        onPressed: () {
                          AuthService().anonymousSignIn(context);
                        },
                        height: 50.0,
                        child: const Icon(MdiIcons.ghost),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 2, 0, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Text(
                      ' with Google',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 9),
                    ),
                    SizedBox(width: 45),
                    Text(
                      'anonymously*',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 9),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 11),
              const Text(
                '*if you continue anonymously, you won’t be able to continue with other devices later and you won’t be able to write blog',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 9),
              ),
            ],
          ),
        ),
      ),
    );
  }
}