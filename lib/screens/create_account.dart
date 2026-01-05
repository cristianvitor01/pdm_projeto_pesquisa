import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdm_projeto_pesquisa/routers/pages.dart';
import 'package:pdm_projeto_pesquisa/utils/app_colors.dart';
import 'package:pdm_projeto_pesquisa/widgets/elevatedbuttom.dart';
import 'package:pdm_projeto_pesquisa/widgets/textfieldcustom.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

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
                    'Criar Conta',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                      color: AppColors.green,
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Campo de e-mail
                  CustomTextField(
                    hintText: 'Nome',
                    keyboardType: TextInputType.text,
                    isLoginStyle: true,
                  ),

                  const SizedBox(height: 20),

                  // Campo de senha
                  CustomTextField(
                    hintText: 'Matrícula',
                    keyboardType: TextInputType.text,
                    isLoginStyle: true,
                  ),

                  const SizedBox(height: 20),

                  // Campo de e-mail
                  CustomTextField(
                    hintText: 'E-mail',
                    keyboardType: TextInputType.emailAddress,
                    isLoginStyle: true,
                  ),

                  const SizedBox(height: 20),

                  // Campo de senha
                  CustomTextField(
                    hintText: 'Senha',
                    keyboardType: TextInputType.visiblePassword,
                    isLoginStyle: true,
                  ),

                  const SizedBox(height: 20),

                  // Campo de cofirmar senha
                  CustomTextField(
                    hintText: 'Confirmar senha',
                    keyboardType: TextInputType.text,
                    isLoginStyle: true,
                  ),

                  const SizedBox(height: 20),
                  
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
                          Get.toNamed(Routes.INITIAL); // CORRIGIDO
                          print('criar conta');
                        },
                        child: const Text(
                          'Já tenho uma conta',
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
