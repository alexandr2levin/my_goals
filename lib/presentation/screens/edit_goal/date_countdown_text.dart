
import 'package:flutter/cupertino.dart';

class DateCountdownText extends StatefulWidget {

  final DateTime to;


  DateCountdownText({
    this.to,
  });

  @override
  State<StatefulWidget> createState() => _DateCountdownTextState();

}

class _DateCountdownTextState extends State<DateCountdownText> {

  @override
  void initState() {
    super.initState();
    runStateUpdater();
  }

  Future<void> runStateUpdater() async {
    while(mounted) {
      setState(() {});
      await Future.delayed(Duration(milliseconds: 10));
    }
  }

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();

    var subhead = '';
    if(widget.to.isBefore(now)) {
      subhead = 'Надеюсь, цель достигнута? :3';
    } else {
      var diff = Duration(milliseconds: widget.to.millisecondsSinceEpoch)
          - Duration(milliseconds: now.millisecondsSinceEpoch);
      var daysLeft = diff.inDays;
      var hoursLeft = diff.inHours - (diff.inDays * 24);
      var minutesLeft = diff.inMinutes - (diff.inHours * 60);
      var secondsLeft = diff.inSeconds - (diff.inMinutes * 60);
      var millisecondLeft = diff.inMilliseconds - (diff.inSeconds * 1000);
      subhead = 'Осталось $daysLeft дн. и $hoursLeft:$minutesLeft:$secondsLeft:$millisecondLeft';
    }

    return Text(
      subhead,
      style: TextStyle(fontSize: 16.0),
    );
  }

}