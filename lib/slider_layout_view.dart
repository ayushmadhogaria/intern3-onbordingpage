import 'package:flutter/material.dart';
import 'slider.dart';
import 'slide_dots.dart';
import 'slide_item.dart';

class SliderLayoutView extends StatefulWidget {
  const SliderLayoutView({super.key});

  @override
  State<StatefulWidget> createState() => _SliderLayoutViewState();
}

class _SliderLayoutViewState extends State<SliderLayoutView> {
  int _currentPage = 0;
  final PageController _pageController =
      PageController(initialPage: 0, viewportFraction: 0.6);

  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    foregroundColor: Colors.black87,
  );

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) => topSliderLayout();
  int currentIndex = 0;
  Widget topSliderLayout() => Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: _pageController,
            physics: const ClampingScrollPhysics(),
            onPageChanged: _onPageChanged,
            itemCount: sliderArrayList.length,
            itemBuilder: (ctx, i) => SlideItem(i, _currentPage),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.only(bottom: 250.0),
            child: Text(
              sliderArrayList[_currentPage].sliderMainText,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20.5,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            margin: const EdgeInsets.only(bottom: 200.0),
            child: Text(
              sliderArrayList[_currentPage].sliderSubHeading,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                letterSpacing: 1.5,
                fontSize: 12.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            // alignment: AlignmentDirectional.bottomCenter,
            margin: const EdgeInsets.only(bottom: 130.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                for (int i = 0; i < sliderArrayList.length; i++)
                  if (i == _currentPage) SlideDots(true) else SlideDots(false)
              ],
            ),
          ),
          Stack(
            alignment: AlignmentDirectional.topCenter,
            fit: StackFit.expand,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: () {
                      if (_currentPage == sliderArrayList.length - 1) {
                        _onPageChanged(0);
                        _pageController.animateToPage(0,
                            duration: const Duration(milliseconds: 10),
                            curve: Curves.ease);
                      } else {
                        _onPageChanged(_currentPage + 1);
                        _pageController.animateToPage(_currentPage,
                            duration: const Duration(seconds: 1),
                            curve: Curves.ease);
                      }
                    },
                    child: Container(
                      // width: MediaQuery.of(context).size.width * 0.65,
                      margin: const EdgeInsets.only(left: 80.0),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 15.0),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(12.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Next",
                            style: TextStyle(color: Colors.white),
                          ),
                          Icon(Icons.arrow_forward, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: InkWell(
                    onTap: () {
                      if (_currentPage == 0) {
                      } else {
                        _onPageChanged(_currentPage - 1);
                        _pageController.animateToPage(_currentPage,
                            duration: const Duration(seconds: 1),
                            curve: Curves.ease);
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 15.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0)),
                      child: const Icon(Icons.arrow_back),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: TextButton(
              style: flatButtonStyle,
              onPressed: () {},
              child: const Text(
                "Skip",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      );
}
