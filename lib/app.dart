import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdm_projeto_pesquisa/routers/pages.dart';
import 'package:pdm_projeto_pesquisa/utils/app_colors.dart';
import 'package:pdm_projeto_pesquisa/controllers/auth_controller.dart';
import 'package:pdm_projeto_pesquisa/screens/login_screen.dart';
import 'package:pdm_projeto_pesquisa/screens/metas_page.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final authController = Get.find<AuthController>();
      if (authController.user.value != null) {
        return MetasPage();
      } else {
        return LoginScreen();
      }
    });
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Login App',
      theme: ThemeData(
        primaryColor: AppColors.white,

        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),

        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.green,
          iconTheme: const IconThemeData(color: AppColors.white),
          titleTextStyle: const TextStyle(
            color: AppColors.white,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.INITIAL,
      getPages: AppPages.pages,
    );
  }
}
