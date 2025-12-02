import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdm_projeto_pesquisa/routers/pages.dart';
import 'package:pdm_projeto_pesquisa/utils/app_colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Login App',
      theme: ThemeData(
        primaryColor: AppColors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.green,
          iconTheme: const IconThemeData(color: AppColors.white),
          titleTextStyle: const TextStyle(color: AppColors.white, fontSize: 25, fontWeight: FontWeight.w600),
        ),
      ),
      debugShowCheckedModeBanner: false,

      initialRoute: Routes.INITIAL,
      getPages: AppPages.pages,
    );
  }
}
