import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdm_projeto_pesquisa/utils/app_colors.dart';
import 'package:pdm_projeto_pesquisa/routers/pages.dart';
import 'package:pdm_projeto_pesquisa/widgets/elevatedbuttom.dart';
import 'package:pdm_projeto_pesquisa/widgets/textfieldcustom.dart';
import 'package:pdm_projeto_pesquisa/controllers/auth_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),

                  // IMAGEM DE LOGIN
                  Center(
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: 260,
                      fit: BoxFit.contain,
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                      color: Color.fromARGB(255, 66, 190, 25),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Campo de e-mail
                  CustomTextField(
                    hintText: 'E-mail',
                    keyboardType: TextInputType.emailAddress,
                    isLoginStyle: true,
                    controller: emailController,
                  ),

                  const SizedBox(height: 20),

                  // Campo de senha
                  CustomTextField(
                    hintText: 'Senha',
                    keyboardType: TextInputType.visiblePassword,
                    isLoginStyle: true,
                    controller: passwordController,
                  ),

                  const SizedBox(height: 20),

                  // Botão de login
                  CustomElevatedButton(
                    text: 'Entrar',
                    onPressed: () async {
                      await authController.signIn(
                        emailController.text.trim(),
                        passwordController.text.trim(),
                      );
                    },
                  ),

                  const SizedBox(height: 30),

                  // Criar conta
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.CREATE_ACCOUNT);
                        },
                        child: const Text(
                          'Não possui uma conta? Criar uma nova conta',
                          style: TextStyle(
                            color: AppColors.gray,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
