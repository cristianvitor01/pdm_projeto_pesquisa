import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdm_projeto_pesquisa/routers/pages.dart';
import 'package:pdm_projeto_pesquisa/utils/app_colors.dart';
import 'package:pdm_projeto_pesquisa/controllers/auth_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
              decoration: const BoxDecoration(color: AppColors.green),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: CircleAvatar(
                      radius: 28,
                      backgroundColor: AppColors.white,
                      child: Icon(
                        Icons.person,
                        color: AppColors.green,
                        size: 32,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: StreamBuilder<DocumentSnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('users')
                          .doc(FirebaseAuth.instance.currentUser?.uid)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.white,
                            ),
                          );
                        }
                        if (snapshot.hasError ||
                            !snapshot.hasData ||
                            !snapshot.data!.exists) {
                          String email =
                              FirebaseAuth.instance.currentUser?.email ??
                              'Usuário não logado';
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  email,
                                  style: const TextStyle(
                                    color: AppColors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text(
                                  'Dados não cadastrados',
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                        var data =
                            snapshot.data!.data() as Map<String, dynamic>;
                        String name = data['name'] ?? 'Nome não encontrado';
                        String matricula =
                            data['matricula'] ?? 'Matrícula não encontrada';
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name,
                                style: const TextStyle(
                                  color: AppColors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                matricula,
                                style: const TextStyle(
                                  color: AppColors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            // const SizedBox(height: 60),
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
              leading: const Icon(
                Icons.fact_check_rounded,
                color: AppColors.gray,
              ),
              title: const Text('Check-In'),
              onTap: () {
                Get.back();
                Get.toNamed(Routes.CHECK_IN);
                debugPrint('create check pressionado');
              },
            ),

            ListTile(
              leading: const Icon(
                Icons.fact_check_rounded,
                color: AppColors.gray,
              ),
              title: const Text('Check-Out'),
              onTap: () {
                Get.back();
                Get.toNamed(Routes.CHECK_OUT);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.content_paste_search_outlined,
                color: AppColors.gray,
              ),
              title: const Text('Formulário de Coleta'),
              onTap: () {
                Get.back();
                Get.toNamed(Routes.FORMULARIO_COLETA);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: AppColors.gray),
              title: const Text('Sair'),
              onTap: () {
                Get.back();
                Get.find<AuthController>().signOut();
              },
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}
