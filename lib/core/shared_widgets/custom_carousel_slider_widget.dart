import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomCarouselSliderWidget extends StatefulWidget {
  final List<Widget> widgets;
  final double height;
  final bool autoPlay;
  // final do
  const CustomCarouselSliderWidget(
      {super.key,
      required this.widgets,
      required this.height,
      this.autoPlay = true});

  @override
  State<CustomCarouselSliderWidget> createState() =>
      _CustomCarouselSliderWidgetState();
}

class _CustomCarouselSliderWidgetState
    extends State<CustomCarouselSliderWidget> {
  int _currentIndex = 0;
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  @override
  void initState() {
    super.initState();
    if (widget.autoPlay)
      Future.delayed(
        const Duration(seconds: 10),
        () {
          _startAutoSlide();
        },
      );
  }

  void _startAutoSlide() {
    Future.doWhile(
      () async {
        await Future.delayed(const Duration(seconds: 10));
        if (mounted) {
          setState(() {
            _currentIndex = (_currentIndex + 1) % widget.widgets.length;
            _carouselController.animateToPage(_currentIndex);
          });
        }
        return mounted;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
            carouselController: _carouselController,
            items: widget.widgets,
            options: CarouselOptions(
              // height: MediaQuery.of(context).size.height * 0.19,
              height: widget.height,
              autoPlay: false,
              enlargeCenterPage: true,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            )),
        // if(!widget.autoPlay)
        //   40.heightSpace,
        Positioned(
            bottom: widget.autoPlay ? 10 : 20,
            left: 50,
            right: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(
                widget.widgets.length,
                (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentIndex == index
                            ? widget.autoPlay
                                ? AppColors.white
                                : AppColors.kGreenBackground
                            : AppColors.grey.withOpacity(0.5)),
                  );
                },
              ),
            ))
      ],
    );
  }
}
