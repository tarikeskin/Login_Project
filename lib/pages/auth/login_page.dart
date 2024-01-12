import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String email, password;
  final formkey = GlobalKey<FormState>();
  final firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff21254A),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Icon(
                    Icons.person_add_alt_rounded,
                    size: 100,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      titleText(),
                      customSizedBox(),
                      emailTextField(),
                      customSizedBox(),
                      passwordTextField(),
                      customSizedBox(),
                      forgotPasswordButton(),
                      customSizedBox(),
                      SignInButton(),
                      customSizedBox(),
                      SignUpButton(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Center SignUpButton() {
    return Center(
      child: TextButton(
        onPressed: () => Navigator.pushNamed(context, "/signUp"),
        child: Text(
          "Hesap Oluştur",
          style: TextStyle(
            color: Colors.pink[200],
          ),
        ),
      ),
    );
  }

  Center SignInButton() {
    return Center(
      child: TextButton(
        onPressed: () async {
          if (formkey.currentState!.validate()) {
            try {
              formkey.currentState!.save();
              final userResult = await firebaseAuth.signInWithEmailAndPassword(
                  email: email, password: password);
                  Navigator.pushReplacementNamed(context, "/homePage");
              print(userResult.user!.email);
            } catch (e) {
              print(e.toString());
            }
          } else {}
        },
        child: Container(
          height: 50,
          width: 150,
          margin: EdgeInsets.symmetric(horizontal: 60),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color(0xff31274F)),
          child: Center(
            child: Text(
              "Giriş Yap",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  Center forgotPasswordButton() {
    return Center(
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, "/forgotpasswordscreen");
        },
        child: Text(
          "Şifremi Unuttum",
          style: TextStyle(
            color: Colors.pink[200],
          ),
        ),
      ),
    );
  }

  TextFormField passwordTextField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Bilgileri eksiksiz doldurunuz ";
        } else {}
      },
      onSaved: (value) {
        password = value!;
      },
      obscureText: true,
      style: TextStyle(color: Colors.grey),
      decoration: customInputDecoration("Şifre"),
    );
  }

  TextFormField emailTextField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Bilgileri eksiksiz doldurunuz ";
        } else {}
      },
      onSaved: (value) {
        email = value!;
      },
      style: TextStyle(color: Colors.grey),
      decoration: customInputDecoration(
        "E-mail",
      ),
    );
  }

  Text titleText() {
    return Text(
      "Merhaba, \nHoşgeldiniz",
      style: TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget customSizedBox() => SizedBox(height: 20);

  InputDecoration customInputDecoration(String hintText) {
    return InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)));
  }
}
