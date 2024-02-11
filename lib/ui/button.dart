import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    this.height = 30,
    this.width = 100,
    required this.text,
    this.onClick,
    this.color,
  });

  final double? height;
  final double? width;
  final Color? color;
  final String text;
  final void Function()? onClick;

  @override
  Widget build(BuildContext context) {
    return Ink(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color ?? const Color(0xFF548CFF),
          borderRadius: BorderRadius.circular(15),
        ),
        child: InkWell(
          onTap: onClick,
          borderRadius: BorderRadius.circular(15),
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      
    );
  }
}
