import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_app_sql/View/splash_screen/splash_screen.dart';
import 'view/Home_Page/Home_Page.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/', page:() => SplashScreen()),
        // GetPage(name: '/folder', page:() => FolderPage()),
        // GetPage(name: '/', page:() => HomePage()),
      ],
    );
  }
}
