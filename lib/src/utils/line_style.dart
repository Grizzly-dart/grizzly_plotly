part of grizzly.plotly;

/// Configures line style
class LineStyle {
  /// Sets the line color
  final String color;

  /// Sets the width of the line
  final num width;

  LineStyle({this.color: '#444', this.width: 0});

  Map<String, dynamic> get toDict {
    final ret = <String, dynamic>{};
    if (color != '#444') ret['color'] = color;
    if (width != 0) ret['width'] = width;
    return ret;
  }
}

/// Configures curve style
class CurveStyle {
  /// Color of the curve
  final String color;

  /// Width of the curve
  final double width;

  /// How the curve shall be interpolated between two points
  final LineShape shape;

  final double smoothing;

  /// Sets the dash style of lines.
  ///
  /// Default: solid
  final StrokeStyle dash;

  /// Dash line length
  final double dashLength;

  /// Simplifies lines by removing nearly-collinear points. When transitioning lines,
  /// it may be desirable to disable this so that the number of points along the
  /// resulting SVG path is unaffected.
  ///
  /// default: True
  final bool simplify;

  CurveStyle(
      {this.color,
      this.width: 2.0,
      this.shape: LineShape.linear,
      this.smoothing: 1.0,
      this.dash: StrokeStyle.solid,
      this.dashLength,
      this.simplify: true});

  /// Converts to the format Plotly understands
  Map<String, dynamic> get toDict {
    final ret = <String, dynamic>{};
    if (color is String) ret['color'] = color;
    if (width is double && width != 2.0) ret['width'] = width;
    if (shape is LineShape && shape != LineShape.linear)
      ret['shape'] = shape.text;
    if (smoothing is double && smoothing != 1.0) ret['smoothing'] = smoothing;
    if (dash is StrokeStyle) {
      if (dash != StrokeStyle.solid) ret['dash'] = dash.text;
    } else {
      if (dashLength is double) ret['dash'] = dashLength;
    }
    if (simplify is bool && !simplify) ret['simplify'] = 'False';
    return ret;
  }
}

/// How a curve shall be interpolated between two points
class LineShape {
  final int id;

  final String text;

  const LineShape(this.id, this.text);

  /// Linear curve
  static const LineShape linear = const LineShape(0, 'linear');

  static const LineShape spline = const LineShape(1, 'spline');

  static const LineShape hv = const LineShape(2, 'hv');

  static const LineShape vh = const LineShape(3, 'vh');

  static const LineShape hvh = const LineShape(4, 'hvh');

  static const LineShape vhv = const LineShape(5, 'vhv');
}

/// Stroke style
class StrokeStyle {
  final int id;

  final String text;

  const StrokeStyle(this.id, this.text);

  static const StrokeStyle solid = const StrokeStyle(0, 'solid');

  static const StrokeStyle dot = const StrokeStyle(1, 'dot');

  static const StrokeStyle dash = const StrokeStyle(2, 'dash');

  static const StrokeStyle longdash = const StrokeStyle(3, 'longdash');

  static const StrokeStyle dashdot = const StrokeStyle(4, 'dashdot');

  static const StrokeStyle longdashdot = const StrokeStyle(5, 'longdashdot');
}
