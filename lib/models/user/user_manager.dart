import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:hm_imoveis_pim/helpers/firebase_erros.dart';
import 'package:hm_imoveis_pim/models/user/user.dart';

class UserManager extends ChangeNotifier {
  UserManager() {
    _loadingCurrentUser();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  final Firestore firestore = Firestore.instance;

  User user;

  bool _loading = false;
  bool get loading => _loading;

  bool get isLoggedIn => user != null;

  //Login
  Future<void> signIn({User user, Function onFail, Function onSuccess}) async {
    loading = true;
    try {
      final AuthResult result = await auth.signInWithEmailAndPassword(
          email: user.email, password: user.password);

      //Salvando usuário logado na hora do login
      await _loadingCurrentUser(firebaseUser: result.user);

      onSuccess();
    } on PlatformException catch (e) {
      onFail(getErrorString(e.code));
    }
    loading = false;
  }

  //Criando usuário
  Future<void> signUp({User user, Function onFail, Function onSuccess}) async {
    loading = true;

    try {
      final AuthResult result = await auth.createUserWithEmailAndPassword(
          email: user.email, password: user.password);

      //Salvando usuário logado na hora do signUp
      //this.user = result.user;

      //Salvando o id do usuário criado no objeto user
      user.id = result.user.uid;
      this.user = user;

      //Salvando dados do usuário
      await user.saveData();

      onSuccess();
    } on PlatformException catch (e) {
      onFail(getErrorString(e.code));
    }
  }

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  //Retornando usuário que esta logado
  Future<void> _loadingCurrentUser({FirebaseUser firebaseUser}) async {
    final FirebaseUser currentUser = firebaseUser ?? await auth.currentUser();
    //Salvando usuário atual no objeto user
    if (currentUser != null) {
      final DocumentSnapshot docUser =
          await firestore.collection('users').document(currentUser.uid).get();
      //Transformando os dados do usuário em um objeto do tipo user
      user = User.fromDocument(docUser);
      print(user.name);
      notifyListeners();
    }
  }

  //Encerrando sessão do usuário
  void signOut() {
    auth.signOut();
    user = null;
    notifyListeners();
  }
}
