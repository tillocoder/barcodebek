import 'dart:ui';

extension ColorJson on Color {
  void custom(int value) {
    Color(
      int.parse('0xFF$value'),
    );
  }
}
