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

class SignupScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final User user = User();
  @override
  Widget build(BuildContext context) {
    String msg = 'Campo obrigatório';
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: ColorsApp.primaryColor(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 12),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Form(
                  key: _formKey,
                  child: Consumer<UserManager>(
                    builder: (_, userManager, __) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Criar Conta',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: const Icon(
                                    Icons.close,
                                    size: 20,
                                  ),
                                  onPressed: () => Navigator.of(context).pop(),
                                )
                              ],
                            ),
                          ),
                          TextFormFieldWidget(
                            prefixIcon: FontAwesomeIcons.userAlt,
                            textInputType: TextInputType.text,
                            hintText: 'Nome Completo',
                            enabled: !userManager.loading,
                            onSaved: (name) => user.name = name,
                            validator: (name) {
                              if (name.isEmpty) {
                                return msg;
                              } else if (name.trim().split(' ').length <= 1) {
                                return 'Informe seu nome completo';
                              }
                              return null;
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: TextFormFieldWidget(
                              prefixIcon: FontAwesomeIcons.solidEnvelope,
                              textInputType: TextInputType.emailAddress,
                              autocorrect: false,
                              hintText: 'E-mail',
                              enabled: !userManager.loading,
                              onSaved: (email) => user.email = email,
                              validator: (email) {
                                if (email.isEmpty) {
                                  return msg;
                                } else if (!emailValid(email)) {
                                  return 'Informe um e-mail válido';
                                }
                                return null;
                              },
                            ),
                          ),
                          TextFormFieldWidget(
                            prefixIcon: FontAwesomeIcons.solidEnvelope,
                            textInputType: TextInputType.visiblePassword,
                            autocorrect: false,
                            hintText: 'Senha',
                            obscureText: true,
                            enabled: !userManager.loading,
                            onSaved: (password) => user.password = password,
                            validator: (password) {
                              if (password.isEmpty) {
                                return msg;
                              } else if (password.length < 6) {
                                return 'Informe uma senha com mais de 6 caracteres';
                              }
                              return null;
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: TextFormFieldWidget(
                              prefixIcon: FontAwesomeIcons.solidEnvelope,
                              textInputType: TextInputType.visiblePassword,
                              autocorrect: false,
                              hintText: 'Repetir Senha',
                              obscureText: true,
                              enabled: !userManager.loading,
                              onSaved: (confirmPassword) =>
                                  user.confirmPassword = confirmPassword,
                              validator: (password) {
                                if (password.isEmpty) {
                                  return msg;
                                } else if (password.length < 6) {
                                  return 'Informe uma senha com mais de 6 caracteres';
                                }
                                return null;
                              },
                            ),
                          ),
                          RaisedButtonWidget(
                            color: ColorsApp.secondaryColor(),
                            disabledColor:
                                ColorsApp.secondaryColor().withAlpha(100),
                            text: userManager.loading
                                ? CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation(
                                      ColorsApp.secondaryColor(),
                                    ),
                                  )
                                : const Text(
                                    'CRIAR CONTA',
                                    style: TextStyle(
                                      letterSpacing: 2,
                                    ),
                                  ),
                            onPressed: userManager.loading
                                ? null
                                : () {
                                    if (_formKey.currentState.validate()) {
                                      _formKey.currentState.save();

                                      //Verificando se as senhas são iguais
                                      if (user.password !=
                                          user.confirmPassword) {
                                        _scaffoldKey.currentState.showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'As senhas não são iguais',
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
                                        return;
                                      }
                                      context.read<UserManager>().signUp(
                                            user: user,
                                            onSuccess: () {
                                              Navigator.of(context).pop();
                                            },
                                            onFail: (e) {
                                              _scaffoldKey.currentState
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Usuário não cadastrado: $e',
                                                    style:
                                                        GoogleFonts.montserrat(
                                                      textStyle:
                                                          const TextStyle(
                                                        letterSpacing: 2,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ),
                                                  backgroundColor: Colors.red,
                                                ),
                                              );
                                            },
                                          );
                                    }
                                  },
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 24, bottom: 16),
                            child: Divider(),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Já tem uma conta?',
                                style: TextStyle(fontSize: 16),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: GestureDetector(
                                  onTap: () => Navigator.of(context)
                                      .pushReplacementNamed('/login'),
                                  child: Text(
                                    'Login',
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
      ),
    );
  }
}
