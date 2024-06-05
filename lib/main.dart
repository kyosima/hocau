import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hocau/unit.dart';
import 'package:hocau/view/auth/create_account_page.dart';
import 'package:hocau/view/auth/enter_password.dart';
import 'package:hocau/view/auth/login_page.dart';
import 'package:hocau/view/blog/blog_detail_page.dart';
import 'package:hocau/view/dashboard/dashboard_page.dart';
import 'package:hocau/view/lake/lake_child_detail_page.dart';
import 'package:hocau/view/lake/lake_detail_page.dart';
import 'package:hocau/view/notification/notificaiton_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final kW = MediaQuery.of(context).size.width;
    final kH = MediaQuery.of(context).size.height;
    return GetMaterialApp(
      title: 'Hồ Câu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        appBarTheme: AppBarTheme(
            backgroundColor: pColor,
            elevation: 0,
            titleTextStyle: TextStyle(
              fontSize: kW < 450 ? 17 : 22,
              fontWeight: FontWeight.bold,
            )),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          fixedSize: MaterialStateProperty.all(
            Size(kW, kW < 450 ? 48 : 60),
          ),
          backgroundColor: MaterialStateProperty.all(
            pColor,
          ),
          shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0))),
        )),
        textTheme: GoogleFonts.beVietnamProTextTheme(),
      ),
      home: DashboardPage(),
      getPages: [
        GetPage(
          name: '/enterPassword',
          page: () => EnterPasswordPage(),
        ),
        GetPage(
          name: '/createAccount',
          page: () => CreateAccountPage(),
        ),
        GetPage(
          name: '/dashboard',
          page: () => DashboardPage(),
        ),
        GetPage(
          name: '/blogDetail',
          page: () => BlogDetailPage(),
        ),
        GetPage(
          name: '/notification',
          page: () => NotificationPage(),
        ),
        GetPage(
          name: '/lakeDetail',
          page: () => LakeDetailPage(),
        ),
        GetPage(
          name: '/lakeChild',
          page: () => LakeChildDetailPage(),
        ),
      ],
    );
  }
}
