import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum MLoaderType {
  android,
  ios,
  square,
  circle,
  custom,
}

class MLoader extends StatefulWidget {
  /// [MLoader] shows differnt type of loaders with different customization options.
  const MLoader(
      {super.key,
        this.loaderColorOne = Colors.redAccent,
        this.loaderColorTwo = Colors.green,
        this.loaderColorThree = Colors.blueAccent,
        this.duration = const Duration(milliseconds: 1000),
        this.type = MLoaderType.android,
        this.loaderIconOne,
        this.loaderIconTwo,
        this.loaderIconThree,
        this.androidLoaderColor,
        this.loaderstrokeWidth = 4.0,
        this.size = 35,
        this.child});

  /// Type of [Widget] used only in custom type and it is prominent over the loaderIconOne, loaderIconTwo, loaderIconThree in custom type
  final Widget? child;

  /// Type of GFColor or [Color] which defines the color of the first dot in only  circle or square type of loader
  final Color loaderColorOne;

  /// Type of GFColor or [Color] which defines the color of the second dot in only  circle or square type of loader
  final Color loaderColorTwo;

  /// Type of GFColor or [Color] which defines the color of the third dot in only  circle or square type of loader
  final Color loaderColorThree;

  /// Type of duration which defines the animation duration of the loader only in circle and square type of loader
  final Duration duration;

  /// Type of [MLoaderType] ie, android, ios, circle , square and custom
  final MLoaderType type;

  /// Type of [Widget] which takes text, icons or images for first dot only in custom type of loader
  final Widget? loaderIconOne;

  /// Type of [Widget] which takes text, icons or images for second dot only in custom type of loader
  final Widget? loaderIconTwo;

  /// Type of [Widget] which takes text, icons or images for third dot only in custom type of loader
  final Widget? loaderIconThree;

  /// type of Animation<Color> used to change the color of the android loader only
  final Animation<Color>? androidLoaderColor;

  /// type of [double] used to change the stroke width of the android loader only
  final double loaderstrokeWidth;

  /// type of [double] or [GFSize] ie, small , medium or large which is used
  /// to change the size of android, ios, circle and square loaders only
  final double size;

  @override
  _MLoaderState createState() => _MLoaderState();
}

class _MLoaderState extends State<MLoader>
    with SingleTickerProviderStateMixin {
  late Animation<double> loaderAnimation1;
  late Animation<double> loaderAnimation2;
  late Animation<double> loaderAnimation3;
  late AnimationController controller;
  Interval interval = const Interval(0.1, 0.81, curve: Curves.linear);

  @override
  void initState() {
    controller = AnimationController(duration: widget.duration, vsync: this);
    loaderAnimation1 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: controller, curve: interval),
    );
    loaderAnimation2 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: controller, curve: interval),
    );
    loaderAnimation3 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: controller, curve: interval),
    );
    controller.addListener(() {
      setState(() {});
    });
    controller.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Container(
    child: widget.child != null
        ? Loader(
      radius: widget.size * 0.3,
      type: widget.type,
      child: widget.child,
    )
        : widget.type == MLoaderType.android
        ? Center(
        child: SizedBox(
          height: widget.size * 0.7,
          width: widget.size * 0.7,
          child: CircularProgressIndicator(
            valueColor: widget.androidLoaderColor,
            strokeWidth: widget.loaderstrokeWidth,
            // value: 20,
          ),
        ))
        : widget.type == MLoaderType.ios
        ? Center(
      child: CupertinoActivityIndicator(
          radius: widget.size * 0.4),
    )
        : Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Opacity(
          opacity: loaderAnimation1.value <= 0.3
              ? 2.5 * loaderAnimation1.value
              : (loaderAnimation1.value > 0.30 &&
              loaderAnimation1.value <= 0.70)
              ? 1.0
              : 2.5 - (2.5 * loaderAnimation1.value),
          child: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Loader(
              radius: widget.size * 0.3,
              color: widget.loaderColorOne,
              type: widget.type,
              icon: widget.loaderIconOne,
              child: widget.child,
            ),
          ),
        ),
        Opacity(
          opacity: loaderAnimation2.value <= 0.3
              ? 2.5 * loaderAnimation2.value
              : (loaderAnimation2.value > 0.30 &&
              loaderAnimation2.value <= 0.70)
              ? 1.0
              : 2.5 - (2.5 * loaderAnimation2.value),
          child: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Loader(
              radius: widget.size * 0.44,
              color: widget.loaderColorTwo,
              type: widget.type,
              icon: widget.loaderIconTwo,
            ),
          ),
        ),
        Opacity(
          opacity: loaderAnimation3.value <= 0.3
              ? 2.5 * loaderAnimation3.value
              : (loaderAnimation3.value > 0.30 &&
              loaderAnimation3.value <= 0.70)
              ? 1.0
              : 2.5 - (2.5 * loaderAnimation3.value),
          child: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Loader(
              radius: widget.size * 0.3,
              color: widget.loaderColorThree,
              type: widget.type,
              icon: widget.loaderIconThree,
            ),
          ),
        ),
      ],
    ),
  );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class Loader extends StatelessWidget {
  const Loader(
      {super.key,
        this.radius,
        this.color,
        this.type,
        this.icon,
        this.size,
        this.child});
  final double? radius;
  final Color? color;
  final MLoaderType? type;
  final Widget? icon;
  final double? size;
  final Widget? child;

  @override
  Widget build(BuildContext context) => Center(
    child: type == MLoaderType.custom
        ? Container(child: child ?? icon ?? Container())
        : Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
          color: color,
          shape: type == MLoaderType.circle
              ? BoxShape.circle
              : BoxShape.rectangle),
    ),
  );
}