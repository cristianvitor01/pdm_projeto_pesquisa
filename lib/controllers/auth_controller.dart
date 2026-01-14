import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pdm_projeto_pesquisa/routers/pages.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Rx<User?> user = Rx<User?>(null);

  @override
  void onInit() {
    super.onInit();
    user.bindStream(_auth.authStateChanges());
  }

  Future<void> signIn(String email, String password) async {
    if (email.isEmpty) {
      Get.snackbar('Erro', 'Digite o e-mail.');
      return;
    }
    if (password.isEmpty) {
      Get.snackbar('Erro', 'Digite a senha.');
      return;
    }
    if (password.length < 6) {
      Get.snackbar('Erro', 'A senha deve ter pelo menos 6 caracteres.');
      return;
    }
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAllNamed(Routes.HOME);
    } on FirebaseAuthException catch (e) {
      String message;
      switch (e.code) {
        case 'user-not-found':
          message = 'E-mail inválido.';
          break;
        case 'wrong-password':
          message = 'Senha inválida.';
          break;
        case 'invalid-email':
          message = 'E-mail inválido.';
          break;
        case 'user-disabled':
          message = 'Esta conta foi desativada.';
          break;
        default:
          message = 'Erro ao fazer login: ${e.message}';
      }
      Get.snackbar('Erro', message);
    } catch (e) {
      Get.snackbar('Erro', 'Erro inesperado: ${e.toString()}');
    }
  }

  Future<void> signUp(
    String email,
    String password,
    String name,
    String matricula,
  ) async {
    if (name.isEmpty) {
      Get.snackbar('Erro', 'Digite o nome.');
      return;
    }
    if (matricula.isEmpty) {
      Get.snackbar('Erro', 'Digite a matrícula.');
      return;
    }
    if (email.isEmpty) {
      Get.snackbar('Erro', 'Digite o e-mail.');
      return;
    }
    if (password.isEmpty) {
      Get.snackbar('Erro', 'Digite a senha.');
      return;
    }
    if (password.length < 6) {
      Get.snackbar('Erro', 'A senha deve ter pelo menos 6 caracteres.');
      return;
    }
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      // Store additional data in Firestore
      try {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({'name': name, 'matricula': matricula, 'email': email});
      } catch (e) {
        // Ignore Firestore errors for now
        print('Erro ao salvar no Firestore: $e');
      }
      await _auth.signOut();
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar('Sucesso', 'Conta criada com sucesso!');
    } on FirebaseAuthException catch (e) {
      String message;
      switch (e.code) {
        case 'email-already-in-use':
          message = 'Este e-mail já está em uso.';
          break;
        case 'weak-password':
          message = 'A senha é muito fraca.';
          break;
        case 'invalid-email':
          message = 'E-mail inválido.';
          break;
        default:
          message = 'Erro ao criar conta: ${e.message}';
      }
      Get.snackbar('Erro', message);
    } catch (e) {
      Get.snackbar('Erro', 'Erro inesperado: ${e.toString()}');
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
