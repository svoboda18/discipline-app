import 'package:discipline/ui/button.dart';
import 'package:discipline/ui/login.dart';
import 'package:discipline/ui/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(children: [
            const SizedBox(
              height: 18,
            ),
            Image.asset('assets/icon/squanchy.png'),
            const SizedBox(
              height: 12,
            ),
            Text(
              'Squantchy!',
              style: GoogleFonts.bangers(
                color: Colors.white,
                fontSize: 64,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              'Your friend Squanchy is busy, can you squanch-in and give him a hand?',
              textAlign: TextAlign.center,
              style: GoogleFonts.luckiestGuy(
                color: Colors.white,
                fontSize: 18,
                fontStyle: FontStyle.italic,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ButtonWidget(height: 50, width: 140, text: 'Login', onClick: () => Get.to(const LoginPage()),),
                  const SizedBox(
                    height: 12,
                  ),
                  ButtonWidget(
                    height: 50,
                    width: 140,
                    text: 'Signup',
                    color: const Color(0xFF272B34),
                    onClick: () => Get.to(const SignupPage()),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Copyright © 2024 Rick & Morty. All rights reserved.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
