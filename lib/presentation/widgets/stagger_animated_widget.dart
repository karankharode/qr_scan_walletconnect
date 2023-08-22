import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class StaggerAnimatedWidget extends StatelessWidget {
  const StaggerAnimatedWidget(
      {Key? key,
      required this.children,
      this.align = MainAxisAlignment.center,
      this.direction = "Vertical",
      this.isStaggered = true,
      this.duration = 400,
      this.delay = 0,
      this.offset = 100,
      this.animation = "Slide",
      this.scale = 0.1,
      this.flipAxis = FlipAxis.x})
      : super(key: key);

  final List<Widget> children;

  final MainAxisAlignment align;
  final String direction;
  final bool isStaggered;
  final int duration;
  final int delay;
  final double offset;
  final String animation;
  final double scale;
  final FlipAxis flipAxis;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: isStaggered
          ? Column(
              mainAxisAlignment: align,
              children: AnimationConfiguration.toStaggeredList(
                duration: Duration(milliseconds: duration),
                delay: Duration(milliseconds: delay),
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
            )
          : AnimationConfiguration.synchronized(
              duration: Duration(milliseconds: duration),
              child: animation == "Slide"
                  ? direction == "Vertical"
                      ? SlideAnimation(
                          verticalOffset: offset,
                          child: FadeInAnimation(
                            child: Column(
                                mainAxisAlignment: align, children: children),
                          ),
                        )
                      : SlideAnimation(
                          horizontalOffset: offset,
                          child: FadeInAnimation(
                            child: Column(
                                mainAxisAlignment: align, children: children),
                          ),
                        )
                  : animation == "Scale"
                      ? ScaleAnimation(
                          scale: scale,
                          child: FadeInAnimation(
                            child: Column(
                                mainAxisAlignment: align, children: children),
                          ),
                        )
                      : animation == "Fade"
                          ? FadeInAnimation(
                              child: Column(
                                  mainAxisAlignment: align, children: children),
                            )
                          : FlipAnimation(
                              flipAxis: flipAxis,
                              child: FadeInAnimation(
                                child: Column(
                                    mainAxisAlignment: align,
                                    children: children),
                              ),
                            )),
    );
    ;
  }
}
