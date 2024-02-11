import 'dart:math';

import 'package:discipline/ui/discipline.dart';
import 'package:discipline/ui/discipline_card.dart';
import 'package:discipline/ui/section.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final colors = [null, const Color(0xFF8E9FE6), const Color(0xFFFEEB97)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: CustomScrollView(
            clipBehavior: Clip.none,
            slivers: [
              const SliverToBoxAdapter(
                  child: SizedBox(
                height: 60,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Hi, Good morning Ilham! 👋',
                          style: TextStyle(
                            fontSize: 26,
                            color: Colors.white,
                          ),
                        ),
                        Icon(
                          FluentIcons.alert_24_regular,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ],
                ),
              )),
              const SliverToBoxAdapter(
                  child: SizedBox(
                height: 20,
              )),
              const SliverToBoxAdapter(
                child: SectionWidget(
                  title: 'Your Disciplines',
                  child: DisciplineWidget(
                    name: 'No-Squantchy',
                    checkInInterval: Duration(seconds: 4),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SectionWidget(
                  title: 'Available Disciplines',
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) => DisciplineWidget(
                      name: 'Drink Water sefefefzfezf',
                      color: colors[index],
                      checkInInterval: const Duration(hours: 2),
                    ),
                    separatorBuilder: (ctx, index) => const SizedBox(
                      width: 10,
                    ),
                    itemCount: colors.length,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Text(
                  'Discover Latest Challanges',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              ...['GYM Power', 'Prayer', 'Calisthenics'].map(
                (t) => SliverToBoxAdapter(
                  child: DisciplineCardWidget(
                    title: t,
                    checkInInterval: Duration(minutes: Random.secure().nextInt(12000)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
