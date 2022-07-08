import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:health_care/screens/login_page.dart';
import 'package:health_care/screens/register_page.dart';
import 'cares_page.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/createaccountpageimage01.png',
              width: 350,
              height: 350,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Comece Agora Um\nAtendimento!',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Encontre cuidadores qualificados a\nqualquer momento',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 70,
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                backgroundColor: const Color.fromRGBO(0, 101, 156, 1),
                primary: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 131, vertical: 30),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const RegisterPage(),
                  ),
                );
              },
              child: const Text('Crie Uma Conta'),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                backgroundColor: Colors.white,
                primary: const Color.fromRGBO(0, 101, 156, 1),
                padding:
                    const EdgeInsets.symmetric(horizontal: 177, vertical: 30),
                side: const BorderSide(
                  color: Color.fromRGBO(0, 101, 156, 1),
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              },
              child: const Text('Entrar'),
            ),
          ],
        ),
      ),
      bottomSheet: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Você é um Cuidador?',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            width: 2,
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CaresPage(),
                ),
              );
            },
            child: const Text('Clique Aqui!'),
          ),
        ],
      ),
    );
  }
}
