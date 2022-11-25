import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medcollapp/api/DioClient.dart';
import 'package:medcollapp/pages/HomePage.dart';

main() async {
  await DioClient.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MedCollapp',
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      getPages: [
        GetPage(
            name: '/',
            page: () {
              return const HomePage();
            }),
        //GetPage(name: '/home', page: () => HomePage()),
      ],
    );
  }
}
