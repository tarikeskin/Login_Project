import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
                      SignUpButton(),
                      customSizedBox(),
                      backToLoginpage()
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
        onPressed: () async {
          if (formkey.currentState!.validate()) {
            formkey.currentState!.save();
            try {
              var userResult =
                  await firebaseAuth.createUserWithEmailAndPassword(
                      email: email, password: password);
              formkey.currentState!.reset();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Hesap oluşturuldu, lütfen giriş yapınız"),
                ),
              );
              Navigator.pushReplacementNamed(context, "/loginPage");
            } catch (e) {
              print(e.toString());
            }
          } else {}
        },
        child: Text(
          "Hesap Oluştur",
          style: TextStyle(
            color: Colors.pink[200],
          ),
        ),
      ),
    );
  }

  Center backToLoginpage() {
    return Center(
      child: TextButton(
        onPressed: () => Navigator.pushNamed(context, "/loginPage"),
        child: Text(
          "Giriş sayfasına geri dön",
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

  Widget customSizedBox() => SizedBox(
        height: 20,
      );

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
