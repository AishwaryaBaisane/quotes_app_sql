import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_app_sql/View/Folder_Page/folder_page.dart';

import '../Home_Page/home_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(onTap: () {
        Get.to(() => HomeScreen());
      },
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xff131a24),
             image: DecorationImage(image: AssetImage('assets/img/splash2.png'),fit: BoxFit.fitWidth)
          ),
        ),
      ),
    );
  }
}
