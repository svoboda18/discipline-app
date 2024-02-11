import 'package:discipline/ui/button.dart';
import 'package:discipline/ui/field.dart';
import 'package:discipline/ui/navbar.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _validUsername = ValueNotifier<bool>(false);
  final _validPassword = ValueNotifier<bool>(false);
  final _validConfirmPassword = ValueNotifier<bool>(false);

  bool isAccepted(String str) =>
      RegExp(r'^\S{3,}$', caseSensitive: false).hasMatch(str);

  bool _validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return false;
    }

    return isAccepted(value);
  }

  bool _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return false;
    }
    return isAccepted(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            FluentIcons.arrow_left_24_regular,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('Signup', style: TextStyle(color: Colors.white)),
        clipBehavior: Clip.hardEdge,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: CustomScrollView(
            slivers: [
              ...[
                SizedBox(
                  height: MediaQuery.of(context).size.height * .3,
                  child: Image.asset(
                    'assets/icon/squanchy.png',
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.contain,
                  ),
                ),
                Text(
                  'Squantchy!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.bangers(
                    color: Colors.white,
                    fontSize: 64,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ].map(
                (e) => SliverToBoxAdapter(
                  child: e,
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FieldWidget(
                      textEditingController: _usernameController,
                      hint: 'Username',
                      keyboardType: TextInputType.text,
                      icon: const Icon(
                        FluentIcons.person_24_filled,
                        color: Colors.white,
                      ),
                      valid: _validUsername,
                      validator: _validateUsername,
                    ),
                    const SizedBox(height: 20),
                    FieldWidget(
                      textEditingController: _passwordController,
                      hint: 'Password',
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      icon: const Icon(
                        FluentIcons.key_24_filled,
                        color: Colors.white,
                      ),
                      valid: _validPassword,
                      validator: _validatePassword,
                    ),
                    const SizedBox(height: 20),
                    FieldWidget(
                      textEditingController: _confirmPasswordController,
                      hint: 'Confirm Password',
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      icon: const Icon(
                        FluentIcons.key_24_filled,
                        color: Colors.white,
                      ),
                      valid: _validConfirmPassword,
                      validator: (value) =>
                          value.isNotEmpty && _validPassword.value && value == _passwordController.text,
                    ),
                    const SizedBox(height: 20),
                    ButtonWidget(
                      height: 50,
                      width: 140,
                      text: 'Signup',
                      onClick: () async {
                        if (_validUsername.value && _validPassword.value && _validConfirmPassword.value) {
                          await Get.offAll(const NavbarWidget());
                          // Validation passed, perform login logic
                          // For example, authenticate user
                          // if authentication successful, navigate to home screen
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      /*bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'By countinue-ing, you agree that you will sequanch-in in time.',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
            ),
            Text(
              'Sequanch-Squanch',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: const Color(0xFF548CFF),
              ),
            ),
          ],
        ),
      ),*/
    );
  }
}
