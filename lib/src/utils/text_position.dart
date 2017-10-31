part of grizzly.plotly;

class TextPosition {
  final int id;

  final String text;

  const TextPosition(this.id, this.text);

  static List<TextPosition> values = const <TextPosition>[
    topLeft,
    topCenter,
    topRight,
    middleLeft,
    middleCenter,
    middleRight,
    bottomLeft,
    bottomCenter,
    bottomRight,
  ];

  static const TextPosition topLeft = const TextPosition(0, 'top left');

  static const TextPosition topCenter = const TextPosition(1, 'top center');

  static const TextPosition topRight = const TextPosition(2, 'top right');

  static const TextPosition middleLeft = const TextPosition(3, 'middle left');

  static const TextPosition middleCenter =
      const TextPosition(4, 'middle center');

  static const TextPosition middleRight = const TextPosition(5, 'middle right');

  static const TextPosition bottomLeft = const TextPosition(6, 'bottom left');

  static const TextPosition bottomCenter =
      const TextPosition(7, 'bottom center');

  static const TextPosition bottomRight = const TextPosition(8, 'bottom right');
}
