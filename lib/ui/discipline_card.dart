import 'dart:math';

import 'package:discipline/ui/button.dart';
import 'package:discipline/ui/card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DisciplineCardWidget extends StatelessWidget {
  const DisciplineCardWidget(
      {super.key, required this.title, required this.checkInInterval});

  final String title;
  final Duration checkInInterval;

  String durationToString(Duration duration) {
    var days = duration.inDays;

    final hours = duration.inHours.remainder(24);
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    final units = [];

    if (days >= 365) {
      final years = (days / 365).floor();
      units.add('$years year');
      days %= 365;
    } else if (days >= 182) {
      units.add('half year');
      days %= 182;
    } else if (days >= 30) {
      units.add('month');
      days %= 30;
    } else if (days > 7) {
      units.add('week');
    } else if (days > 1) {
      units.add('$days days');
    } else if (days == 1) {
      units.add('day');
    }

    if (hours > 0) {
      units.add(hours == 1 ? 'hour' : '$hours hours');
    }
    if (minutes > 0) {
      units.add(minutes == 1 ? 'minute' : '$minutes minutes');
    }
    if (seconds > 0) {
      units.add(seconds == 1 ? 'second' : '$seconds seconds');
    }

    units.first = 'every ${units.first}';

    if (units.isEmpty) {
      return 'every instant';
    } else if (units.length == 1) {
      return units[0];
    } else if (units.length == 2) {
      return '${units[0]} and ${units[1]}';
    } else {
      final lastUnit = units.removeLast();
      final joinedUnits = units.join(', ');
      return '$joinedUnits, and $lastUnit';
    }
  }

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 2,
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
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: Text(
                    'Checks in ${durationToString(checkInInterval)}',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                const ButtonWidget(color: Colors.green, text: 'Enroll')
              ],
            ),
          ),
          Positioned(
            right: 18,
            child: SizedBox(
              height: 112,
              width: 89,
              child: Image.asset(
                  'assets/images/img${Random.secure().nextInt(2) + 1}.png'),
            ),
          )
        ],
      ),
    );
  }
}
