import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdm_projeto_pesquisa/routers/pages.dart';
import 'package:pdm_projeto_pesquisa/utils/app_colors.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: AppColors.green,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Center(
                    child: CircleAvatar(
                      radius: 28,
                      backgroundColor: AppColors.white,
                      child: Icon(Icons.person, color: AppColors.green, size: 32),
                    ),
                  ),
                  SizedBox(width: 12),
                  Center(child: Text('Nazaré Barbosa', style: TextStyle(color: AppColors.white, fontSize: 18, fontWeight: FontWeight.bold))),
                ],
              ),
            ),

            ListTile(
              leading: const Icon(Icons.calendar_month, color: AppColors.gray),
              title: const Text('Metas'),
              onTap: () {
                Get.back();
                Get.toNamed(Routes.HOME);
              },
            ),

            ListTile(
              leading: const Icon(Icons.track_changes, color: AppColors.gray),
              title: const Text('Metas semanais'),
              onTap: () {
                Get.back();
                Get.toNamed(Routes.WEEK_META);
              },
            ),

            ListTile(
              leading: const Icon(Icons.fact_check_rounded, color: AppColors.gray),
              title: const Text('Check-In'),
              onTap: () {
                Get.back();
                Get.toNamed(Routes.CHECK_IN);
                debugPrint('create check pressionado');
              },
            ),

            ListTile(
              leading: const Icon(Icons.fact_check_rounded, color: AppColors.gray),
              title: const Text('Check-Out'),
              onTap: () {
                Get.back();
                Get.toNamed(Routes.CHECK_OUT);
              },
            ),
            ListTile(
              leading: const Icon(Icons.content_paste_search_outlined, color: AppColors.gray),
              title: const Text('Formulário de Coleta'),
              onTap: () {
                Get.back();
                Get.toNamed(Routes.FORMULARIO_COLETA);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: AppColors.gray),
              title: const Text('Configurações'),
              onTap: () {
                Get.back();
                Get.toNamed(Routes.CREATE_ACCOUNT);
              },
            ),

            

            const Spacer(),

          ],
        ),
      ),
    );
  }
}
