import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAllNamed(Routes.HOME);
    } on FirebaseAuthException catch (e) {
      String message;
      switch (e.code) {
        case 'user-not-found':
          message = 'Conta não encontrada. Verifique o e-mail.';
          break;
        case 'wrong-password':
          message = 'Senha incorreta.';
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
      Get.defaultDialog(
        title: 'Erro',
        middleText: message,
        textConfirm: 'OK',
        onConfirm: () => Get.back(),
      );
    } catch (e) {
      Get.defaultDialog(
        title: 'Erro',
        middleText: 'Erro inesperado: ${e.toString()}',
        textConfirm: 'OK',
        onConfirm: () => Get.back(),
      );
    }
  }

  Future<void> signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.offAllNamed(Routes.HOME);
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
      Get.defaultDialog(
        title: 'Erro',
        middleText: message,
        textConfirm: 'OK',
        onConfirm: () => Get.back(),
      );
    } catch (e) {
      Get.defaultDialog(
        title: 'Erro',
        middleText: 'Erro inesperado: ${e.toString()}',
        textConfirm: 'OK',
        onConfirm: () => Get.back(),
      );
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
