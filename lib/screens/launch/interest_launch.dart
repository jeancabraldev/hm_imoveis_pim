import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hm_imoveis_pim/components/buttons/raised/raised_button_widget.dart';
import 'package:hm_imoveis_pim/components/forms/text_form_field_widget.dart';
import 'package:hm_imoveis_pim/helpers/validator.dart';
import 'package:hm_imoveis_pim/models/interest/interest.dart';
import 'package:hm_imoveis_pim/models/interest/interest_manager.dart';
import 'package:hm_imoveis_pim/models/launch/launch.dart';
import 'package:hm_imoveis_pim/utils/colors_app.dart';
import 'package:provider/provider.dart';

class InterestLaunch extends StatelessWidget {
  InterestLaunch({this.launch});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final Launch launch;
  final Interest interest = Interest();
  @override
  Widget build(BuildContext context) {
    final TextEditingController _controllerCode =
        TextEditingController(text: launch.code);

    return Scaffold(
      appBar: AppBar(
        title: Text(launch.title),
      ),
      key: _scaffoldKey,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(launch.images.first),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 12),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Form(
                  key: _formKey,
                  child: Consumer<InterestManager>(
                    builder: (_, interestManager, __) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormFieldWidget(
                            controller: _controllerCode,
                            prefixIcon: FontAwesomeIcons.houseUser,
                            onSaved: (code) => interest.code = code,
                            enabled: false,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: TextFormFieldWidget(
                              prefixIcon: FontAwesomeIcons.userAlt,
                              textInputType: TextInputType.text,
                              hintText: 'Nome',
                              enabled: !interestManager.loading,
                              onSaved: (name) => interest.name = name,
                              validator: (name) {
                                if (name.isEmpty) {
                                  return 'Campo obrigatório';
                                } else if (name.trim().split(' ').length <= 1) {
                                  return 'Informe seu nome completo';
                                }
                                return null;
                              },
                            ),
                          ),
                          TextFormFieldWidget(
                            prefixIcon: FontAwesomeIcons.solidEnvelope,
                            textInputType: TextInputType.emailAddress,
                            hintText: 'E-mail',
                            enabled: !interestManager.loading,
                            onSaved: (email) => interest.email = email,
                            autocorrect: false,
                            validator: (email) {
                              if (email.isEmpty) {
                                return 'Campo obrigatório';
                              } else if (!emailValid(email)) {
                                return 'Informe um e-mail válido';
                              }
                              return null;
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: TextFormFieldWidget(
                              prefixIcon: FontAwesomeIcons.solidComment,
                              textInputType: TextInputType.text,
                              hintText: 'Deixe sua mensagem',
                              enabled: !interestManager.loading,
                              onSaved: (message) => interest.message = message,
                            ),
                          ),
                          RaisedButtonWidget(
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();
                                interestManager.saveInterest(
                                    interest: interest,
                                    onSuccess: () {
                                      Navigator.of(context)
                                          .pushReplacementNamed(
                                              '/confirmationMessageScreen');
                                    },
                                    onFail: (e) {
                                      _scaffoldKey.currentState.showSnackBar(
                                        SnackBar(
                                          content: Text('Erro: $e'),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    });
                              }
                            },
                            text: interestManager.loading
                                ? CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation(
                                      ColorsApp.primaryColor(),
                                    ),
                                  )
                                : const Text(
                                    'ENVIAR INTERESSE',
                                    style: TextStyle(
                                      letterSpacing: 2,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                            color: ColorsApp.secondaryColor(),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
