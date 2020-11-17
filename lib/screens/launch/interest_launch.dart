import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hm_imoveis_pim/components/buttons/raised/raised_button_widget.dart';
import 'package:hm_imoveis_pim/components/forms/text_form_field_widget.dart';
import 'package:hm_imoveis_pim/helpers/validator.dart';
import 'package:hm_imoveis_pim/models/launch/launch.dart';
import 'package:hm_imoveis_pim/utils/colors_app.dart';

class InterestLaunch extends StatelessWidget {
  const InterestLaunch({this.launch});
  final Launch launch;
  @override
  Widget build(BuildContext context) {
    final TextEditingController _controllerCode =
        TextEditingController(text: launch.code);
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text(launch.title),
      ),
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
                    fit: BoxFit.contain),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormFieldWidget(
                        controller: _controllerCode,
                        prefixIcon: FontAwesomeIcons.houseUser,
                        enabled: false,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: TextFormFieldWidget(
                          prefixIcon: FontAwesomeIcons.userAlt,
                          textInputType: TextInputType.text,
                          hintText: 'Nome',
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
                      const Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: TextFormFieldWidget(
                          prefixIcon: FontAwesomeIcons.solidComment,
                          textInputType: TextInputType.text,
                          hintText: 'Deixe sua mensagem',
                        ),
                      ),
                      RaisedButtonWidget(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            //TODO: SALVAR MENSAGEM DO CLIENTE NO FIREBASE
                          }
                        },
                        text: const Text(
                          'ENVIAR INTERESSE',
                          style: TextStyle(
                            letterSpacing: 2,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        color: ColorsApp.secondaryColor(),
                      )
                    ],
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
