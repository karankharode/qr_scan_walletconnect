import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class StaggerAnimatedExpandedList extends StatelessWidget {
  const StaggerAnimatedExpandedList(
      {Key? key,
      required this.children,
      this.align = MainAxisAlignment.center,
      this.direction = "Vertical",
      this.isStaggered = true,
      this.duration = 400,
      this.offset = 100,
      this.animation = "Slide",
      this.scale = 0.1,
      this.flipAxis = FlipAxis.x,
      this.physics = const BouncingScrollPhysics()})
      : super(key: key);

  final List<Widget> children;
  final MainAxisAlignment align;
  final String direction;
  final bool isStaggered;
  final int duration;
  final double offset;
  final String animation;
  final double scale;
  final FlipAxis flipAxis;
  final ScrollPhysics physics;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView(
        shrinkWrap: true,
        physics: physics,
        children: AnimationConfiguration.toStaggeredList(
          duration: Duration(milliseconds: duration),
          childAnimationBuilder: (widget) => animation == "Slide"
              ? direction == "Vertical"
                  ? SlideAnimation(
                      verticalOffset: offset,
                      child: FadeInAnimation(
                        child: widget,
                      ),
                    )
                  : SlideAnimation(
                      horizontalOffset: offset,
                      child: FadeInAnimation(
                        child: widget,
                      ),
                    )
              : animation == "Scale"
                  ? ScaleAnimation(
                      scale: scale,
                      child: FadeInAnimation(
                        child: widget,
                      ),
                    )
                  : animation == "Fade"
                      ? FadeInAnimation(
                          child: widget,
                        )
                      : FlipAnimation(
                          flipAxis: flipAxis,
                          child: FadeInAnimation(
                            child: widget,
                          ),
                        ),
          children: children,
        ),
      ),
    );
    ;
  }
}
