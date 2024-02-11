import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionWidget extends StatelessWidget {
  const SectionWidget({
    super.key,
    required this.title,
    required this.child,
    this.hasMore = true,
  });

  final String title;
  final bool hasMore;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (hasMore)
                const Icon(
                  FluentIcons.arrow_right_24_filled,
                  color: Colors.white,
                )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(child: child),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
