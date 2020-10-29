import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hm_imoveis_pim/components/buttons/raised/raised_button_widget.dart';
import 'package:hm_imoveis_pim/components/forms/text_form_field_widget.dart';
import 'package:hm_imoveis_pim/helpers/validator.dart';
import 'package:hm_imoveis_pim/models/user/user.dart';
import 'package:hm_imoveis_pim/models/user/user_manager.dart';
import 'package:hm_imoveis_pim/utils/colors_app.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        // ignore: avoid_unnecessary_containers
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 15),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 3,
            margin: const EdgeInsets.symmetric(horizontal: 12),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Form(
                key: _formKey,
                child: Consumer<UserManager>(
                  builder: (_, userManager, __) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 30),
                          child: Text(
                            'Acessar com E-mail',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        TextFormFieldWidget(
                          controller: _controllerEmail,
                          prefixIcon: FontAwesomeIcons.solidEnvelope,
                          textInputType: TextInputType.emailAddress,
                          autocorrect: false,
                          enabled: !userManager.loading,
                          hintText: 'E-mail',
                          validator: (email) {
                            if (!emailValid(email)) {
                              return 'E-mail inválido';
                            }
                            return null;
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: TextFormFieldWidget(
                            controller: _controllerPassword,
                            prefixIcon: FontAwesomeIcons.lock,
                            textInputType: TextInputType.visiblePassword,
                            autocorrect: false,
                            enabled: !userManager.loading,
                            hintText: 'Senha',
                            obscureText: true,
                            validator: (password) {
                              if (password.isEmpty || password.length < 6) {
                                return 'Senha inválida';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: GestureDetector(
                            onTap: () {},
                            child: const Text(
                              'Esqueceu sua senha?',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        RaisedButtonWidget(
                          color: ColorsApp.secondaryColor(),
                          disabledColor:
                              ColorsApp.secondaryColor().withAlpha(100),
                          text: userManager.loading
                              ? CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation(
                                    ColorsApp.primaryColor(),
                                  ),
                                )
                              : const Text(
                                  'ENTRAR',
                                  style: TextStyle(
                                    letterSpacing: 2,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                          onPressed: userManager.loading
                              ? null
                              : () {
                                  //Pegando conteúdos dos campos caso sejam validos
                                  if (_formKey.currentState.validate()) {
                                    userManager.signIn(
                                      user: User(
                                        email: _controllerEmail.text,
                                        password: _controllerPassword.text,
                                      ),
                                      onFail: (e) {
                                        _scaffoldKey.currentState.showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Falha na autenticação: $e',
                                              style: GoogleFonts.montserrat(
                                                textStyle: const TextStyle(
                                                  letterSpacing: 2,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            backgroundColor: Colors.red,
                                          ),
                                        );
                                      },
                                      onSuccess: () {
                                        Navigator.of(context).pop();
                                      },
                                    );
                                  }
                                },
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 30, bottom: 15),
                          child: Text(
                            'Ou acesse com',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        RaisedButtonWidget(
                          color: ColorsApp.facebookColor(),
                          text: const Text(
                            'FACEBOOK',
                            style: TextStyle(
                              letterSpacing: 2,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {},
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 24, bottom: 16),
                          child: Divider(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Não tem uma conta?',
                              style: TextStyle(fontSize: 16),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: GestureDetector(
                                onTap: () => Navigator.of(context)
                                    .pushReplacementNamed('/signup'),
                                child: Text(
                                  'Criar Conta',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: ColorsApp.fourthColor(),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
