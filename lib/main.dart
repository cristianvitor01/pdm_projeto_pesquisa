import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:get/get.dart';

import 'app.dart';
import 'models/meta.dart';
import 'controllers/metas_semanais_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(MetaAdapter());
  await Hive.openBox<Meta>('metas');

  Get.put(MetasSemanaisController());

  runApp(const MyApp());
}