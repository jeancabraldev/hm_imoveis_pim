import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hm_imoveis_pim/components/buttons/raised/raised_button_widget.dart';
import 'package:hm_imoveis_pim/components/drawer/drawer_widget.dart';
import 'package:hm_imoveis_pim/components/forms/text_form_field_widget.dart';
import 'package:hm_imoveis_pim/helpers/validator.dart';
import 'package:hm_imoveis_pim/models/contact_us/contact_us.dart';
import 'package:hm_imoveis_pim/models/contact_us/contact_us_manager.dart';
import 'package:hm_imoveis_pim/models/page/page_manager.dart';
import 'package:hm_imoveis_pim/models/preferences/preferences_manager.dart';
import 'package:hm_imoveis_pim/utils/colors_app.dart';
import 'package:provider/provider.dart';

class ContactUsScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final String msg = 'Campo obrigatório';
  final ContactUs contactUs = ContactUs();
  @override
  Widget build(BuildContext context) {
    final PageManager _pageManager = context.watch<PageManager>();
    final darkTheme = Provider.of<PreferencesManager>(context);
    return Scaffold(
      key: _scaffoldKey,
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
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 12),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Form(
                  key: _formKey,
                  child: Consumer<ContactUsManager>(
                    builder: (_, contactUsManager, __) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormFieldWidget(
                            prefixIcon: FontAwesomeIcons.userAlt,
                            textInputType: TextInputType.text,
                            hintText: 'Nome Completo',
                            onSaved: (name) => contactUs.name = name,
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
                              onSaved: (email) => contactUs.email = email,
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
                            onSaved: (message) => contactUs.message = message,
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
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  _formKey.currentState.save();
                                  await contactUsManager.saveContact(
                                      contactUs: contactUs,
                                      onSuccess: () {
                                        showDialog(
                                            barrierDismissible: false,
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                content: SingleChildScrollView(
                                                  child: ListBody(
                                                    children: const [
                                                      Text(
                                                        'Recebemos a sua mensagem!',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: 18),
                                                      ),
                                                      SizedBox(height: 10),
                                                      Text(
                                                        'Em breve entraremos em contato com você.',
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      SizedBox(height: 10),
                                                      Text(
                                                        ':)',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          fontSize: 28,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      _pageManager.setPage(0);
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text(
                                                      'FECHAR',
                                                      style: TextStyle(
                                                        color: ColorsApp
                                                            .primaryColor(),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            });
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
