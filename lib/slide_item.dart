import 'package:flutter/material.dart';

import 'slider.dart';

class SlideItem extends StatelessWidget {
  final int index;
  final int currentindex;
  const SlideItem(this.index, this.currentindex, {super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Stack(
          children: [
            Container(
              height:
                  index == currentindex ? size.width * 1.2 : size.width * 1.5,
              width: size.height * 1.4,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:
                          AssetImage(sliderArrayList[index].sliderImageUrl))),
            ),
          ],
        ),
        const SizedBox(
          height: 30.0,
        ),
      ],
    );
  }
}
