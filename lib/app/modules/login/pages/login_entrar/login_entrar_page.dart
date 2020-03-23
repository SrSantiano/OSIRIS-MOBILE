import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:osiris/app/modules/login/pages/login_entrar/login_entrar_controller.dart';
import 'package:osiris/app/utils/constants.dart';
import 'package:osiris/app/utils/rounded_button.dart';
import 'package:osiris/app/utils/social_icons.dart';

class LoginEntrarPage extends StatefulWidget {
  final String title;
  const LoginEntrarPage({Key key, this.title = "PerfilLogin"})
      : super(key: key);

  @override
  _LoginEntrarPageState createState() => _LoginEntrarPageState();
}

class _LoginEntrarPageState
    extends ModularState<LoginEntrarPage, LoginEntrarController> {
  bool showSpinner = false;
  String email;
  String password;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller.logo(); 

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image(image: AssetImage('assets/foodhouse.png')),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Digite seu email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Digite sua senha'),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                title: 'Log In',
                colour: Colors.amber[600],
                onPressed: () async {
                },
              ),
              SizedBox(
                  height: 30,
                ),
                Container(
                  height: 50,
                  width: 100,
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SocialIcon(
                        colors: [
                          Color(0xFF102397),
                          Color(0xFF187adf),
                        ],
                        icon: Image.asset("assets/facebook_logo.png"),
                        onPressed: controller.loginWithFacebook,
                      ),
                      SocialIcon(
                        colors: [
                          Color(0xFFff4f38),
                          Color(0xFFff355d),
                        ],
                        icon: Image.asset("assets/google_logo.png"),

                        //letra: Text("G" , style: TextStyle(fontSize: 35, fontWeight: FontWeight.w800),),

                        onPressed: controller.loginWithGoogle,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Novo aqui? ",
                      style: TextStyle(fontFamily: "Poppins-Medium"),
                    ),
                    InkWell(
                      onTap: () =>
                       Modular.to.pushReplacementNamed('/cadastro'),
                      child: Text("Cadastre-se agora!",
                          style: TextStyle(
                              color: Color(0xFF5d74e3),
                              fontFamily: "Poppins-Bold")),
                    )
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
