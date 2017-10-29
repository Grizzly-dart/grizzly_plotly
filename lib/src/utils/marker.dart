part of grizzly.plotly;

class Marker {
  final MarkerSymbol symbol;

  /// Sets the marker opacity
  ///
  /// Default: 1.0
  final double opacity;

  /// Sets the marker size (in px)
  ///
  /// Default: 6
  final double size;

  final EachSize sizes;

  /// Sets a maximum number of points to be drawn on the graph.
  ///
  /// "0" corresponds to no limit
  /// Default: 0
  final int maxDisplayed;

  /// Determines whether or not a colorbar is displayed.
  final bool showScale;

  // TODO 'showscale'
  // TODO colorbar

  final MarkerLine line;

  // TODO gradient

  final String color;

  final EachColor colors;

  const Marker(
      {this.symbol,
      this.opacity: 1.0,
      this.size: 6.0,
      this.sizes,
      this.maxDisplayed: 0,
      this.showScale,
      this.line,
      this.color,
      this.colors});

  Map<String, dynamic> get toDict {
    final ret = <String, dynamic>{};

    if (symbol != null && symbol != MarkerSymbol.circle)
      ret['symbol'] = symbol.text;
    if (opacity != null && opacity != 1.0) ret['opacity'] = opacity;
    if (maxDisplayed != null && maxDisplayed != 0)
      ret['maxdisplayed'] = maxDisplayed;
    if (size != null)
      ret['size'] = size;
    else if (sizes != null) {
      ret['size'] = sizes.sizes;
      if (sizes.ref != null && sizes.ref != 1) ret['sizeref'] = sizes.ref;
      if (sizes.min != null && sizes.min != 0) ret['sizemin'] = sizes.min;
      ret['sizemode'] = sizes.isDiameter ? 'diameter' : 'area';
    }

    // TODO 'showscale'
    // TODO colorbar

    if (line != null) ret['line'] = line.toDict;
    // TODO gradient
    if (color != null)
      ret['color'] = color;
    else if (colors != null) {
      ret['color'] = colors.colors;
      if (colors.colorScale != null) ret['colorscale'] = colors.colorScaleList;
      if (colors.cauto != null && colors.cauto) ret['cauto'] = colors.cauto;
      if (colors.cmax != null) ret['cmax'] = colors.cmax;
      if (colors.cmin != null) ret['cmin'] = colors.cmin;
      if (!colors.autoScale) ret['autocolorscale'] = colors.autoScale;
      if (colors.reverseScale) ret['reversescale'] = colors.reverseScale;
    }

    return ret;
  }
}

class MarkerLine {
  final double width;

  final String color;

  final EachColor colors;

  MarkerLine({this.width, this.color, this.colors});

  Map<String, dynamic> get toDict {
    final ret = <String, dynamic>{};

    if (width != null) ret['width'] = width;

    if (color != null)
      ret['color'] = color;
    else if (colors != null) {
      ret['color'] = colors.colors;
      if (colors.colorScale != null) ret['colorscale'] = colors.colorScaleList;
      if (colors.cauto != null && colors.cauto) ret['cauto'] = colors.cauto;
      if (colors.cmax != null) ret['cmax'] = colors.cmax;
      if (colors.cmin != null) ret['cmin'] = colors.cmin;
      if (!colors.autoScale) ret['autocolorscale'] = colors.autoScale;
      if (colors.reverseScale) ret['reversescale'] = colors.reverseScale;
    }

    return ret;
  }
}

class MarkerSymbol {
  final int id;

  final String text;

  const MarkerSymbol(this.id, this.text);

  static const MarkerSymbol circle = const MarkerSymbol(0, 'circle');

  static const MarkerSymbol circleOpen = const MarkerSymbol(100, 'circle-open');

  static const MarkerSymbol circleDot = const MarkerSymbol(200, 'circle-dot');

  static const MarkerSymbol circleOpenDot =
      const MarkerSymbol(300, 'circle-open-dot');

  static const MarkerSymbol square = const MarkerSymbol(1, 'square');

  static const MarkerSymbol squareOpen = const MarkerSymbol(101, 'square-open');

  static const MarkerSymbol squareDot = const MarkerSymbol(201, 'square-dot');

  static const MarkerSymbol squareOpenDot =
      const MarkerSymbol(301, 'square-open-dot');

  static const MarkerSymbol diamond = const MarkerSymbol(2, 'diamond');

  static const MarkerSymbol diamondOpen =
      const MarkerSymbol(102, 'diamond-open');

  static const MarkerSymbol diamondDot = const MarkerSymbol(202, 'diamond-dot');

  static const MarkerSymbol diamondOpenDot =
      const MarkerSymbol(302, 'diamond-open-dot');

  static const MarkerSymbol cross = const MarkerSymbol(3, 'cross');

  static const MarkerSymbol crossOpen = const MarkerSymbol(103, 'cross-open');

  static const MarkerSymbol crossDot = const MarkerSymbol(203, 'cross-dot');

  static const MarkerSymbol crossOpenDot =
      const MarkerSymbol(303, 'cross-open-dot');

  static const MarkerSymbol x = const MarkerSymbol(4, 'x');

  static const MarkerSymbol xOpen = const MarkerSymbol(104, 'x-open');

  static const MarkerSymbol xDot = const MarkerSymbol(204, 'x-dot');

  static const MarkerSymbol xOpenDot = const MarkerSymbol(304, 'x-open-dot');

  static const MarkerSymbol triangleUp = const MarkerSymbol(5, 'triangle-up');

  static const MarkerSymbol triangleUpOpen =
      const MarkerSymbol(105, 'triangle-up-open');

  static const MarkerSymbol triangleUpDot =
      const MarkerSymbol(205, 'triangle-up-dot');

  static const MarkerSymbol triangleUpOpenDot =
      const MarkerSymbol(305, 'triangle-up-open-dot');

  static const MarkerSymbol triangleDown =
      const MarkerSymbol(6, 'triangle-down');

  static const MarkerSymbol triangleDownOpen =
      const MarkerSymbol(106, 'triangle-down-open');

  static const MarkerSymbol triangleDownDot =
      const MarkerSymbol(206, 'triangle-down-dot');

  static const MarkerSymbol triangleDownOpenDot =
      const MarkerSymbol(306, 'triangle-down-open-dot');

  static const MarkerSymbol triangleLeft =
      const MarkerSymbol(7, 'triangle-left');

  static const MarkerSymbol triangleLeftOpen =
      const MarkerSymbol(107, 'triangle-left-open');

  static const MarkerSymbol triangleLeftDot =
      const MarkerSymbol(207, 'triangle-left-dot');

  static const MarkerSymbol triangleLeftOpenDot =
      const MarkerSymbol(307, 'triangle-left-open-dot');

  static const MarkerSymbol triangleRight =
      const MarkerSymbol(8, 'triangle-right');

  static const MarkerSymbol triangleRightOpen =
      const MarkerSymbol(108, 'triangle-right-open');

  static const MarkerSymbol triangleRightDot =
      const MarkerSymbol(208, 'triangle-right-dot');

  static const MarkerSymbol triangleRightOpenDot =
      const MarkerSymbol(308, 'triangle-right-open-dot');

  static const MarkerSymbol triangleNe = const MarkerSymbol(9, 'triangle-ne');

  static const MarkerSymbol triangleNeOpen =
      const MarkerSymbol(109, 'triangle-ne-open');

  static const MarkerSymbol triangleNeDot =
      const MarkerSymbol(209, 'triangle-ne-dot');

  static const MarkerSymbol triangleNeOpenDot =
      const MarkerSymbol(309, 'triangle-ne-open-dot');

  static const MarkerSymbol triangleSe = const MarkerSymbol(10, 'triangle-se');

  static const MarkerSymbol triangleSeOpen =
      const MarkerSymbol(110, 'triangle-se-open');

  static const MarkerSymbol triangleSeDot =
      const MarkerSymbol(210, 'triangle-se-dot');

  static const MarkerSymbol triangleSeOpenDot =
      const MarkerSymbol(310, 'triangle-se-open-dot');

  static const MarkerSymbol triangleSw = const MarkerSymbol(11, 'triangle-sw');

  static const MarkerSymbol triangleSwOpen =
      const MarkerSymbol(111, 'triangle-sw-open');

  static const MarkerSymbol triangleSwDot =
      const MarkerSymbol(211, 'triangle-sw-dot');

  static const MarkerSymbol triangleSwOpenDot =
      const MarkerSymbol(311, 'triangle-sw-open-dot');

  static const MarkerSymbol triangleNw = const MarkerSymbol(12, 'triangle-nw');

  static const MarkerSymbol triangleNwOpen =
      const MarkerSymbol(112, 'triangle-nw-open');

  static const MarkerSymbol triangleNwDot =
      const MarkerSymbol(212, 'triangle-nw-dot');

  static const MarkerSymbol triangleNwOpenDot =
      const MarkerSymbol(312, 'triangle-nw-open-dot');

  static const MarkerSymbol pentagon = const MarkerSymbol(13, 'pentagon');

  static const MarkerSymbol pentagonOpen =
      const MarkerSymbol(113, 'pentagon-open');

  static const MarkerSymbol pentagonDot =
      const MarkerSymbol(213, 'pentagon-dot');

  static const MarkerSymbol pentagonOpenDot =
      const MarkerSymbol(313, 'pentagon-open-dot');

  static const MarkerSymbol hexagon = const MarkerSymbol(14, 'hexagon');

  static const MarkerSymbol hexagonOpen =
      const MarkerSymbol(114, 'hexagon-open');

  static const MarkerSymbol hexagonDot = const MarkerSymbol(214, 'hexagon-dot');

  static const MarkerSymbol hexagonOpenDot =
      const MarkerSymbol(314, 'hexagon-open-dot');

  static const MarkerSymbol hexagon2 = const MarkerSymbol(15, 'hexagon2');

  static const MarkerSymbol hexagon2Open =
      const MarkerSymbol(115, 'hexagon2-open');

  static const MarkerSymbol hexagon2Dot =
      const MarkerSymbol(215, 'hexagon2-dot');

  static const MarkerSymbol hexagon2OpenDot =
      const MarkerSymbol(315, 'hexagon2-open-dot');

  static const MarkerSymbol octagon = const MarkerSymbol(16, 'octagon');

  static const MarkerSymbol octagonOpen =
      const MarkerSymbol(116, 'octagon-open');

  static const MarkerSymbol octagonDot = const MarkerSymbol(216, 'octagon-dot');

  static const MarkerSymbol octagonOpenDot =
      const MarkerSymbol(316, 'octagon-open-dot');

  static const MarkerSymbol star = const MarkerSymbol(17, 'star');

  static const MarkerSymbol starOpen = const MarkerSymbol(117, 'star-open');

  static const MarkerSymbol starDot = const MarkerSymbol(217, 'star-dot');

  static const MarkerSymbol starOpenDot =
      const MarkerSymbol(317, 'star-open-dot');

  static const MarkerSymbol hexagram = const MarkerSymbol(18, 'hexagram');

  static const MarkerSymbol hexagramOpen =
      const MarkerSymbol(118, 'hexagram-open');

  static const MarkerSymbol hexagramDot =
      const MarkerSymbol(218, 'hexagram-dot');

  static const MarkerSymbol hexagramOpenDot =
      const MarkerSymbol(318, 'hexagram-open-dot');

  static const MarkerSymbol starTriangleUp =
      const MarkerSymbol(19, 'star-triangle-up');

  static const MarkerSymbol starTriangleUpOpen =
      const MarkerSymbol(119, 'star-triangle-up-open');

  static const MarkerSymbol starTriangleUpDot =
      const MarkerSymbol(219, 'star-triangle-up-dot');

  static const MarkerSymbol starTriangleUpOpenDot =
      const MarkerSymbol(319, 'star-triangle-up-open-dot');

  static const MarkerSymbol starTriangleDown =
      const MarkerSymbol(20, 'star-triangle-down');

  static const MarkerSymbol starTriangleDownOpen =
      const MarkerSymbol(120, 'star-triangle-down-open');

  static const MarkerSymbol starTriangleDownDot =
      const MarkerSymbol(220, 'star-triangle-down-dot');

  static const MarkerSymbol starTriangleDownOpenDot =
      const MarkerSymbol(320, 'star-triangle-down-open-dot');

  static const MarkerSymbol starSquare = const MarkerSymbol(21, 'star-square');

  static const MarkerSymbol starSquareOpen =
      const MarkerSymbol(121, 'star-square-open');

  static const MarkerSymbol starSquareDot =
      const MarkerSymbol(221, 'star-square-dot');

  static const MarkerSymbol starSquareOpenDot =
      const MarkerSymbol(321, 'star-square-open-dot');

  static const MarkerSymbol starDiamond =
      const MarkerSymbol(22, 'star-diamond');

  static const MarkerSymbol starDiamondOpen =
      const MarkerSymbol(122, 'star-diamond-open');

  static const MarkerSymbol starDiamondDot =
      const MarkerSymbol(222, 'star-diamond-dot');

  static const MarkerSymbol starDiamondOpenDot =
      const MarkerSymbol(322, 'star-diamond-open-dot');

  static const MarkerSymbol diamondTall =
      const MarkerSymbol(23, 'diamond-tall');

  static const MarkerSymbol diamondTallOpen =
      const MarkerSymbol(123, 'diamond-tall-open');

  static const MarkerSymbol diamondTallDot =
      const MarkerSymbol(223, 'diamond-tall-dot');

  static const MarkerSymbol diamondTallOpenDot =
      const MarkerSymbol(323, 'diamond-tall-open-dot');

  static const MarkerSymbol diamondWide =
      const MarkerSymbol(24, 'diamond-wide');

  static const MarkerSymbol diamondWideOpen =
      const MarkerSymbol(124, 'diamond-wide-open');

  static const MarkerSymbol diamondWideDot =
      const MarkerSymbol(224, 'diamond-wide-dot');

  static const MarkerSymbol diamondWideOpenDot =
      const MarkerSymbol(324, 'diamond-wide-open-dot');

  static const MarkerSymbol hourglass = const MarkerSymbol(25, 'hourglass');

  static const MarkerSymbol hourglassOpen =
      const MarkerSymbol(125, 'hourglass-open');

  static const MarkerSymbol bowtie = const MarkerSymbol(26, 'bowtie');

  static const MarkerSymbol bowtieOpen = const MarkerSymbol(126, 'bowtie-open');

  static const MarkerSymbol circleCross =
      const MarkerSymbol(27, 'circle-cross');

  static const MarkerSymbol circleCrossOpen =
      const MarkerSymbol(127, 'circle-cross-open');

  static const MarkerSymbol circleX = const MarkerSymbol(28, 'circle-x');

  static const MarkerSymbol circleXOpen =
      const MarkerSymbol(128, 'circle-x-open');

  static const MarkerSymbol squareCross =
      const MarkerSymbol(29, 'square-cross');

  static const MarkerSymbol squareCrossOpen =
      const MarkerSymbol(129, 'square-cross-open');

  static const MarkerSymbol squareX = const MarkerSymbol(30, 'square-x');

  static const MarkerSymbol squareXOpen =
      const MarkerSymbol(130, 'square-x-open');

  static const MarkerSymbol diamondCross =
      const MarkerSymbol(31, 'diamond-cross');

  static const MarkerSymbol diamondCrossOpen =
      const MarkerSymbol(131, 'diamond-cross-open');

  static const MarkerSymbol diamondX = const MarkerSymbol(32, 'diamond-x');

  static const MarkerSymbol diamondXOpen =
      const MarkerSymbol(132, 'diamond-x-open');

  static const MarkerSymbol crossThin = const MarkerSymbol(33, 'cross-thin');

  static const MarkerSymbol crossThinOpen =
      const MarkerSymbol(133, 'cross-thin-open');

  static const MarkerSymbol xThin = const MarkerSymbol(34, 'x-thin');

  static const MarkerSymbol xThinOpen = const MarkerSymbol(134, 'x-thin-open');

  static const MarkerSymbol asterisk = const MarkerSymbol(35, 'asterisk');

  static const MarkerSymbol asteriskOpen =
      const MarkerSymbol(135, 'asterisk-open');

  static const MarkerSymbol hash = const MarkerSymbol(26, 'hash');

  static const MarkerSymbol hashOpen = const MarkerSymbol(126, 'hash-open');

  static const MarkerSymbol hashDot = const MarkerSymbol(226, 'hash-dot');

  static const MarkerSymbol hashOpenDot =
      const MarkerSymbol(326, 'hash-open-dot');

  static const MarkerSymbol yUp = const MarkerSymbol(37, 'y-up');

  static const MarkerSymbol yUpOpen = const MarkerSymbol(137, 'y-up-open');

  static const MarkerSymbol yDown = const MarkerSymbol(38, 'y-down');

  static const MarkerSymbol yDownOpen = const MarkerSymbol(138, 'y-down-open');

  static const MarkerSymbol yLeft = const MarkerSymbol(39, 'y-left');

  static const MarkerSymbol yLeftOpen = const MarkerSymbol(139, 'y-left-open');

  static const MarkerSymbol yRight = const MarkerSymbol(40, 'y-right');

  static const MarkerSymbol yRightOpen =
      const MarkerSymbol(140, 'y-right-open');

  static const MarkerSymbol lineEw = const MarkerSymbol(41, 'line-ew');

  static const MarkerSymbol lineEwOpen =
      const MarkerSymbol(141, 'line-ew-open');

  static const MarkerSymbol lineNs = const MarkerSymbol(42, 'line-ns');

  static const MarkerSymbol lineNsOpen =
      const MarkerSymbol(142, 'line-ns-open');

  static const MarkerSymbol lineNe = const MarkerSymbol(43, 'line-ne');

  static const MarkerSymbol lineNeOpen =
      const MarkerSymbol(143, 'line-ne-open');

  static const MarkerSymbol lineNw = const MarkerSymbol(44, 'line-nw');

  static const MarkerSymbol lineNwOpen =
      const MarkerSymbol(144, 'line-nw-open');
}
