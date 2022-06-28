import 'package:flutter/material.dart';
import 'package:flutter_balloon_slider/flutter_balloon_slider.dart';

// ignore: must_be_immutable
class BalloonSliderDemo extends StatelessWidget {
  ValueNotifier<double> _slider1Value = ValueNotifier<double>(0.0);
  // ValueNotifier<double> _slider2Value = ValueNotifier<double>(0.0);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildBalloonSlider(
              showRope: true, color: Colors.red, sliderValue: _slider1Value),
          // _buildBalloonSlider(
          //     showRope: false,
          //     color: Colors.blue,
          //     sliderValue: _slider2Value),
        ],
      ),
      // ),
    );
  }

  Widget _buildBalloonSlider(
      {ValueNotifier<double> sliderValue, Color color, @required showRope}) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        BalloonSlider(
          value: sliderValue.value,
          ropeLength: 55,
          showRope: showRope,
          onChanged: (val) => sliderValue.value = val,
          color: color,
        ),
      ],
    );
  }
}
