import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';

class BlurContainerPage extends StatelessWidget {
  const BlurContainerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Positioned(
            top: 200,
            left: 10,
            child: GradientBall(colors: [Colors.deepOrange, Colors.amber]),
          ),
          const Positioned(
            top: 400,
            right: 10,
            child: GradientBall(
              size: Size.square(200),
              colors: [Colors.blue, Colors.purple],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlurryContainer(
              blur: 8,
              height: 240,
              elevation: 6,
              padding: const EdgeInsets.all(32),
              color: Colors.white.withOpacity(0.15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.transparent,
                    backgroundImage: NetworkImage(
                      'https://loremflickr.com/320/240/cat',
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    "0100 0010 0100 0011",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w200,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        "John Doe".toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.w200,
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "VALID",
                        style: TextStyle(
                          fontWeight: FontWeight.w200,
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "06/24",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GradientBall extends StatelessWidget {
  final List<Color> colors;
  final Size size;
  const GradientBall({
    super.key,
    required this.colors,
    this.size = const Size.square(150),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: colors,
        ),
      ),
    );
  }
}
