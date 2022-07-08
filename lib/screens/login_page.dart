import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_care/screens/home_page.dart';
import 'createaccount_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CreateAccount()));
          },
          color: Colors.black,
        ),
        title: RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
            text: 'Entre ',
            style: TextStyle(
              fontSize: 35,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: 'Agora',
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formkey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/loginpageimage01.png',
                      height: 350,
                      width: 350,
                    ),

                    const Text(
                      'OLÁ NOVAMENTE',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    const Text(
                      'Bem-vindo de volta, você nos fez falta!',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(
                      height: 35,
                    ),

                    //email

                    TextFormField(
                      decoration: const InputDecoration(labelText: 'E-mail'),
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (email) {
                        if (email == null || email.isEmpty) {
                          return 'Por favor, digite seu e-mail';
                        } else if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(_emailController.text)) {
                          return 'Por favor, digite um e-mail correto';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(
                      height: 25,
                    ),

                    //senha

                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Senha'),
                      controller: _passwordController,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      validator: (senha) {
                        RegExp regex = RegExp(r'^.{6,}$');
                        if (senha == null || senha.isEmpty) {
                          return 'Por favor, digite sua senha';
                        }
                        if (!regex.hasMatch(senha)) {
                          return 'Por favor, digite uma senha maior que 6 caracteres';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(
                      height: 35,
                    ),

                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        backgroundColor: const Color.fromRGBO(0, 101, 156, 1),
                        primary: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 175, vertical: 30),
                      ),
                      onPressed: () {
                        signIn(_emailController.text, _passwordController.text);
                      },
                      child: const Text('Login'),
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Forget Passoword?',
                          style: TextStyle(
                            fontSize: 17,
                            color: Color.fromARGB(255, 20, 98, 161),
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    )
                  ]),
            )),
      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'You Have Don`t Account?',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            width: 2,
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const CreateAccount(),
                ),
              );
            },
            child: const Text(
              'Create Account',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void signIn(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(msg: "Login Successful"),
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const HomePage())),
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
}
