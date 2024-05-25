import 'package:flutter/material.dart';
class DragEnd extends StatelessWidget {
  const DragEnd({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        print('onHorizontalDragEnd: $details');
        if (details.primaryVelocity! < 0) {
          print('Dragged Right to Left: ${details.primaryVelocity}');
        } else if (details.primaryVelocity! > 0) {
          print('Dragged Left to Right: ${details.primaryVelocity}');
        }
      },

    );
  }
}