import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:get/get.dart';

import 'app.dart';
import 'models/meta.dart';
import 'controllers/metas_semanais_controller.dart';
import 'controllers/metas_controller.dart';

import 'models/check_in_model.dart';
import 'controllers/check_in_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  
  Hive.registerAdapter(MetaAdapter());
  Hive.registerAdapter(CheckInModelAdapter());

  await Hive.openBox<Meta>('metas');
  await Hive.openBox<CheckInModel>('checkins');

  Get.put(MetasController(), permanent: true);
  Get.put(MetasSemanaisController(), permanent: true);
  Get.put(CheckInController(), permanent: true);
  
  runApp(const MyApp());
}
