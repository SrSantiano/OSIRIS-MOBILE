import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:osiris/app/modules/login/pages/login_cadastro/login_cadastro_controller.dart';
import 'package:osiris/app/utils/constants.dart';
import 'package:osiris/app/utils/rounded_button.dart';

class LoginCadastroPage extends StatefulWidget {
  final String title;
  const LoginCadastroPage({Key key, this.title = "PerfilCadastro"})
      : super(key: key);

  @override
  _LoginCadastroPageState createState() => _LoginCadastroPageState();
}

class _LoginCadastroPageState
    extends ModularState<LoginCadastroPage, LoginCadastroController> {
  final _formKey = GlobalKey<FormState>();

  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
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
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  validator: (val) =>
                      val.isEmpty ? 'Digite um email válido' : null,
                  onChanged: (value) {
                    controller.email = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Digite seu email'),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  validator: (val) => val.length < 5
                      ? 'Entre com uma senha com mais de 6 dígitos'
                      : null,
                  onChanged: (value) {
                    controller.password = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Digite sua senha'),
                ),
                SizedBox(
                  height: 24.0,
                ),
                RoundedButton(
                  title: 'Cadastrar',
                  colour: Colors.amber[600],
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      dynamic result = await controller.registerWithEmailAndPassword();
                      
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
