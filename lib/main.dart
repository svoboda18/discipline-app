import 'package:discipline/controllers/app_controller.dart';
import 'package:discipline/ui/intro.dart';
import 'package:discipline/ui/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  final appController = Get.put(AppController());

  if (!appController.isOffline.value) {
    await GoogleFonts.pendingFonts([
      GoogleFonts.bangers(),
      GoogleFonts.luckiestGuy(),
      GoogleFonts.roboto(),
      GoogleFonts.poppins(),
    ]);
  }

  runApp(Discipline(
    appController: appController,
  ));
}

class Discipline extends StatelessWidget {
  const Discipline({super.key, required this.appController});

  final AppController appController;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: !appController.authController.hasAuthCredentails
          ? const IntroPage()
          : const NavbarWidget(),
    );
  }
}
