import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdm_projeto_pesquisa/utils/app_colors.dart';
import 'package:pdm_projeto_pesquisa/routers/pages.dart';
import 'package:pdm_projeto_pesquisa/widgets/elevatedbuttom.dart';
import 'package:pdm_projeto_pesquisa/widgets/textfieldcustom.dart'; // CORRIGIDO

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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

                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                      color: AppColors.green,
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Campo de matrícula
                  CustomTextField(
                    hintText: 'Matrícula',
                    keyboardType: TextInputType.text,
                  ),

                  const SizedBox(height: 20),

                  // Campo de senha
                  CustomTextField(
                    hintText: 'Senha',
                    keyboardType: TextInputType.visiblePassword,
                  ),

                  const SizedBox(height: 20),

                  // Botão de login
                  CustomElevatedButton(
                    text: 'Entrar',
                    onPressed: () {
                      Get.toNamed(Routes.HOME); 
                      print('entrar pressionado');
                    },
                  ),

                  const SizedBox(height: 30),

                  // Criar conta
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.CREATE_ACCOUNT); // CORRIGIDO
                          print('criar conta');
                        },
                        child: const Text(
                          'Criar nova conta',
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
