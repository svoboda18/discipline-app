import 'dart:math';

import 'package:discipline/ui/discipline_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DisciplineWidget extends StatefulWidget {
  const DisciplineWidget({
    super.key,
    this.color,
    required this.name,
    this.enrolled,
    required this.checkInInterval,
    this.nextCheckin,
  });

  final String name;
  final Color? color;
  final bool? enrolled;
  final Duration checkInInterval;
  final DateTime? nextCheckin;

  @override
  State<DisciplineWidget> createState() => _DisciplineWidgetState();
}

class _DisciplineWidgetState extends State<DisciplineWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () => Get.to(DisciplinePage(title: widget.name, checkInInterval: widget.checkInInterval)),
      child: Container(
        width: 149,
        height: 155,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: widget.color ?? const Color(0xFF00BD56),
        ),
        padding: const EdgeInsets.all(8),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(2),
              child: CircleAvatar(
                child: Image.asset('assets/images/avatar${Random.secure().nextInt(3) + 1}.png'),
              ),
            ),
            Positioned(
              bottom: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'From',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        'Discipline CEO',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
