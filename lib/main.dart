import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hocau/unit.dart';
import 'package:hocau/view/auth/create_account_page.dart';
import 'package:hocau/view/auth/enter_password.dart';
import 'package:hocau/view/blog/blog_detail_page.dart';
import 'package:hocau/view/checkout/checkout_page.dart';
import 'package:hocau/view/dashboard/dashboard_page.dart';
import 'package:hocau/view/event/event_code.dart';
import 'package:hocau/view/event/event_details.dart';
import 'package:hocau/view/event/event_qrcode.dart';
import 'package:hocau/view/event/event_link/event_link_page.dart';
import 'package:hocau/view/event/event_managers/create_event_page.dart';
import 'package:hocau/view/event/event_managers/event_detail_page.dart';
import 'package:hocau/view/event/event_managers/event_page.dart';
import 'package:hocau/view/event/event_managers/event_qr_code.dart';
import 'package:hocau/view/lake/lake_child_detail_page.dart';
import 'package:hocau/view/lake/lake_detail_page.dart';
import 'package:hocau/view/notification/notificaiton_page.dart';
import 'package:hocau/view/referral/referral_link_page.dart';

void main() {
  runApp(const MaterialApp(
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
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
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
        GetPage(
          name: '/checkout',
          page: () => CheckOutPage(),
        ),

        GetPage(
          name: '/event_details',
          page: () => EventDetailPage(),
        ),
        GetPage(
          name: '/event_code',
          page: () => EventCodePage(),
        ),
        GetPage(
          name: '/event_qrcode',
          page: () => EventQrcodePage(),
        ),
          GetPage(
          name: '/eventPage',
          page: () => EventPage(),
        ),
        GetPage(
          name: '/createEvent',
          page: () => CreateEvent(),
        ),
        GetPage(name: '/detailEvent', page: () => EventDetailAccountPage()),
        GetPage(name: '/event_qr', page: () => EventQrCode()),
        GetPage(name: '/event_link', page: () => EventLinkPage()),

        GetPage(name: '/referralLink', page: () => ReferralLinkPage()),

      ],
    );
  }
}
