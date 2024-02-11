import 'package:discipline/ui/section.dart';
import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class DisciplinePage extends StatefulWidget {
  final String title;
  final Duration checkInInterval;

  const DisciplinePage(
      {Key? key, required this.title, required this.checkInInterval})
      : super(key: key);

  @override
  State<DisciplinePage> createState() => _DisciplinePageState();
}

class _DisciplinePageState extends State<DisciplinePage> {

  void _onTimerFinish() {
    showDialog(
      context: context,
      
      builder: (context) => AlertDialog(
      backgroundColor: const Color(0xFF1E1E1E),
        title: Text('Alert', style: GoogleFonts.poppins(fontSize: 24, color: Colors.white),),
        content:  Text('You are screwed, BOZO!. You have Sequached, right? ZERO! thats you, your new STREAK.', style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      appBar: AppBar(
              backgroundColor:  const Color(0xFF1E1E1E).withOpacity(.6),
            leading: IconButton(
              icon:
                  const Icon(FluentIcons.arrow_left_24_regular, color: Colors.white),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            title: Text(widget.title, style: const TextStyle(color: Colors.white)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Text(
                      'Your next check-in is due in',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    CircularCountDownTimer(
                      isReverse: true,
                      duration: widget.checkInInterval.inSeconds,
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height / 3,
                      ringColor: const Color(0xFF272B34),
                      fillColor: const Color(0xFF548CFF),
                      strokeWidth: 9,
                      strokeCap: StrokeCap.round,
                      textStyle: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                      textFormat: CountdownTextFormat.HH_MM_SS,
                      isTimerTextShown: true,
                      autoStart: true,
                      onComplete: _onTimerFinish,
                    ),
                    SectionWidget(
                      hasMore: false,
                      title: 'Your history',
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildCheckIcon(
                            const Icon(
                              FluentIcons.check_24_regular,
                              color: Colors.green,
                            ),
                          ),
                          _buildCheckIcon(
                            const Icon(
                              FluentIcons.checkbox_1_24_regular,
                              color: Colors.red,
                            ),
                          ),
                          _buildCheckIcon(
                            const Icon(
                              FluentIcons.circle_24_regular,
                              color: Colors.yellow,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCheckIcon(Widget icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          icon,
          const SizedBox(width: 10),
          const Text('Date of check time', style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
