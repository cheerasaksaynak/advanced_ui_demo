import 'package:circular_seek_bar/circular_seek_bar.dart';
import 'package:advanced_ui_demo/util/style_text.dart';
import 'package:flutter/material.dart';

class CircularSeekBarExamplePage extends StatefulWidget {
  const CircularSeekBarExamplePage({super.key});

  @override
  State<CircularSeekBarExamplePage> createState() =>
      _CircularSeekBarExamplePageState();
}

class _CircularSeekBarExamplePageState
    extends State<CircularSeekBarExamplePage> {
  final ValueNotifier<double> _valueNotifier = ValueNotifier(0);

  final double _progress = 100;
  final double _startAngle = 45;
  final double _sweepAngle = 270;
  final double _dashWidth = 0;
  final double _dashGap = 0;
  final double _barWidth = 8.0;
  final bool _useGradient = true;
  final bool _rounded = true;
  final bool _animation = true;
  final bool _thumbVisible = true;
  final bool _interactive = true;

  @override
  void dispose() {
    _valueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CircularSeekBar(
      width: double.infinity,
      progress: _progress,
      height: 250,
      barWidth: _barWidth,
      startAngle: _startAngle,
      sweepAngle: _sweepAngle,
      strokeCap: _rounded ? StrokeCap.round : StrokeCap.butt,
      progressGradientColors: _useGradient
          ? [
              Colors.red,
              Colors.orange,
              Colors.yellow,
              Colors.green,
              Colors.blue,
              Colors.indigo,
              Colors.purple
            ]
          : [],
      dashWidth: _dashWidth,
      dashGap: _dashGap,
      animation: _animation,
      curves: Curves.linear,
      innerThumbRadius: _thumbVisible ? 5 : 0,
      innerThumbStrokeWidth: _thumbVisible ? 3 : 0,
      outerThumbRadius: _thumbVisible ? 5 : 0,
      outerThumbStrokeWidth: _thumbVisible ? 10 : 0,
      valueNotifier: _valueNotifier,
      interactive: _interactive,
      child: Center(
        child: ValueListenableBuilder(
            valueListenable: _valueNotifier,
            builder: (_, double value, __) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('${value.round()}',
                        style: kNotoSansBold16.copyWith(color: Colors.white)),
                    Text('progress',
                        style: kNotoSansRegular14.copyWith(color: Colors.grey)),
                  ],
                )),
      ),
    );
  }
}
