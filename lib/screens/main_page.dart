import 'package:aurora/services/auth.dart';
import 'package:aurora/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../widgets/main_app_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MainAppBar(),
              const SizedBox(
                height: 350,
              ),
              Center(
                child: RoundedButton(
                  colour: Colors.amber,
                  paddings: const EdgeInsets.all(8),
                  onPress: () {
                    AuthService().signOut(context);
                  },
                  title: const Text(
                    'Sign Out',
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}