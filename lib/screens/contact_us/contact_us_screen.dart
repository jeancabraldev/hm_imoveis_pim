import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hm_imoveis_pim/components/buttons/raised/raised_button_widget.dart';
import 'package:hm_imoveis_pim/components/drawer/drawer_widget.dart';
import 'package:hm_imoveis_pim/components/forms/text_form_field_widget.dart';
import 'package:hm_imoveis_pim/helpers/validator.dart';
import 'package:hm_imoveis_pim/utils/colors_app.dart';

class ContactUsScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final String msg = 'Campo obrigatório';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: Text(
          'Fale Conosco',
          style: GoogleFonts.montserrat(),
        ),
        centerTitle: true,
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
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/contact_us.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 25),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
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
                        prefixIcon: FontAwesomeIcons.userAlt,
                        textInputType: TextInputType.text,
                        hintText: 'Nome Completo',
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
                        prefixIcon: FontAwesomeIcons.solidComment,
                        textInputType: TextInputType.text,
                        hintText: 'Deixe sua mensagem',
                        validator: (write) {
                          if (write.isEmpty) {
                            return msg;
                          } else if (write.trim().split(' ').length <= 1) {
                            return 'Escreva um pouco mais :)';
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: RaisedButtonWidget(
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              //TODO: SALVAR MENSAGEM DO CLIENTE NO FIREBASE
                            }
                          },
                          text: const Text(
                            'ENVIAR MENSAGEM',
                            style: TextStyle(
                              letterSpacing: 2,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          color: ColorsApp.secondaryColor(),
                        ),
                      ),
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