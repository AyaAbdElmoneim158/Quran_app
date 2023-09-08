import 'package:quran_app/util/app_router.dart';
import 'package:quran_app/util/app_theme.dart';
import 'util/audioplayers_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/quran_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AudioplayersHelper.init();
  await Hive.initFlutter();
  Hive.registerAdapter(QuranModelAdapter());
  await Hive.openBox<QuranModel>('favorites_box');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      themeMode: ThemeMode.light,
      initialRoute: Routes.splashScreen,
      getPages: getPages,
    );
  }
}
