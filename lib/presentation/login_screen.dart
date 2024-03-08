import 'package:flutter/material.dart';
import 'package:multi_language_provider/home_screen.dart';
import 'package:multi_language_provider/utils/app_strings.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            SizedBox(
              height: size.height * 0.1,
            ),
            Text(
              AppString.getLoginTitle(context),
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text(
              AppString.getLoginDesc(context),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: AppString.getLoginEmailHint(context),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: AppString.getLoginPasswordHint(context)),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()));
              },
              child: Text(
                AppString.getLoginBtn(context),
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
