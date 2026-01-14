import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdm_projeto_pesquisa/routers/pages.dart';
import 'package:pdm_projeto_pesquisa/utils/app_colors.dart';
import 'package:pdm_projeto_pesquisa/widgets/elevatedbuttom.dart';
import 'package:pdm_projeto_pesquisa/widgets/textfieldcustom.dart';
import 'package:pdm_projeto_pesquisa/controllers/auth_controller.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController matriculaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final AuthController authController = Get.find<AuthController>();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

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

                  // Campo de nome
                  CustomTextField(
                    hintText: 'Nome',
                    keyboardType: TextInputType.text,
                    isLoginStyle: true,
                    controller: nameController,
                  ),

                  const SizedBox(height: 20),

                  // Campo de matrícula
                  CustomTextField(
                    hintText: 'Matrícula',
                    keyboardType: TextInputType.text,
                    isLoginStyle: true,
                    controller: matriculaController,
                  ),

                  const SizedBox(height: 20),

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
                    keyboardType: TextInputType.text,
                    obscureText: _obscurePassword,
                    isLoginStyle: true,
                    controller: passwordController,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: AppColors.gray,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Campo de confirmar senha
                  CustomTextField(
                    hintText: 'Confirmar senha',
                    keyboardType: TextInputType.text,
                    obscureText: _obscureConfirmPassword,
                    isLoginStyle: true,
                    controller: confirmPasswordController,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureConfirmPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: AppColors.gray,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureConfirmPassword = !_obscureConfirmPassword;
                        });
                      },
                    ),
                  ),

                  const SizedBox(height: 20),

                  CustomElevatedButton(
                    text: 'Criar Conta',
                    onPressed: () async {
                      if (passwordController.text ==
                          confirmPasswordController.text) {
                        await authController.signUp(
                          emailController.text.trim(),
                          passwordController.text.trim(),
                          nameController.text.trim(),
                          matriculaController.text.trim(),
                        );
                      } else {
                        Get.snackbar('Erro', 'As senhas não coincidem');
                      }
                    },
                  ),
                  const SizedBox(height: 30),
                  // Já tenho conta
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.LOGIN);
                        },
                        child: const Text(
                          'Voltar para o login',
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
