import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pdm_projeto_pesquisa/controllers/check_in_controller.dart';
import 'package:pdm_projeto_pesquisa/utils/app_colors.dart';
import 'package:pdm_projeto_pesquisa/widgets/app_drawer.dart';
import 'package:pdm_projeto_pesquisa/routers/pages.dart';

class MetaHistoricoPage extends StatelessWidget {
  const MetaHistoricoPage({super.key});

  String formatarData(DateTime data) {
    return "${data.day.toString().padLeft(2, '0')}/"
        "${data.month.toString().padLeft(2, '0')}/"
        "${data.year}";
  }

  @override
  Widget build(BuildContext context) {
    final CheckInController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Histórico',
          style: TextStyle(color: AppColors.white),
        ),
        backgroundColor: AppColors.green,
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Histórico da meta",
              style: TextStyle(
                color: AppColors.green,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            Obx(() {
              if (controller.checkIns.isEmpty) {
                return const Text("Nenhum histórico encontrado");
              }

              return Column(
                children: controller.checkIns.map((checkin) {
                  return HoverHistoryButton(
                    text: "Dia: ${formatarData(checkin.data)}",
                    onTap: () {
                      Get.toNamed(
                        Routes.META_HISTORICO_IN_DEPTH,
                        arguments: checkin,
                      );
                    },
                  );
                }).toList(),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class HoverHistoryButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const HoverHistoryButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  State<HoverHistoryButton> createState() => _HoverHistoryButtonState();
}

class _HoverHistoryButtonState extends State<HoverHistoryButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: AnimatedPhysicalModel(
        duration: const Duration(milliseconds: 160),
        curve: Curves.easeOut,
        elevation: _hovering ? 8.0 : 2.0,
        shape: BoxShape.rectangle,
        shadowColor: Colors.black.withOpacity(0.12),
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        child: MouseRegion(
          onEnter: (_) => setState(() => _hovering = true),
          onExit: (_) => setState(() => _hovering = false),
          cursor: SystemMouseCursors.click,
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: widget.onTap,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 18,
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.text,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
