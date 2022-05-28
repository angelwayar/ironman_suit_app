import 'package:flutter/material.dart';
import 'package:ironman_suits_app/models/suit_model.dart';
import 'background_custom_clipper.widget.dart';

class CardWidget extends StatelessWidget {
  final Suit suit;

  const CardWidget({Key? key, required this.suit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          width: MediaQuery.of(context).size.width * 0.9,
          child: ClipPath(
            clipper: BackgroundClipper(),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: suit.colors,
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
              ),
            ),
          ),
        ),
        Image.asset(
          suit.imagePaths[0],
          height: 520,
        ),
      ],
    );
  }
}
