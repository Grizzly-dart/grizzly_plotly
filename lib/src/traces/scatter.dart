part of grizzly.plotly;

/// Encloses the data for a scatter trace
class Scatter implements Trace {
  /// X-axis data
  final Iterable<num> x;

  /// Y-axis data
  final Iterable<num> y;

  /// Name of the trace
  final String name;

  /// Should the text appear above the point always or on hover
  ///
  /// Default: false
  final bool showText;

  /// Determines whether or not this trace is visible
  ///
  /// Default: true
  final bool visible;

  /// Determines whether or not an item corresponding to this trace is shown
  /// in the legend.
  ///
  /// Default: true
  final bool showLegend;

  /// Sets the legend group for this trace. Traces part of the same legend group
  /// hide/show at the same time when toggling legend items.
  final String legendGroup;

  /// Sets the opacity of the trace
  ///
  /// Default: 1.0
  final double opacity;

  /// Assigns id labels to each datum. These ids for object constancy of data
  /// points during animation
  final List<String> ids;

  /// Sets text elements associated with each (x,y) pair.
  ///
  /// If a single string, the same string appears over all the data points. If
  /// an array of string, the items are mapped in order to the this trace's (x,y)
  /// coordinates.
  ///
  /// If trace [hoverInfo] contains a "text" flag and [hoverText]
  /// is not set, these elements will be seen in the hover labels.
  final dynamic /* String | Iterable<String> */ text;

  /// Sets hover text elements associated with each (x,y) pair.
  ///
  /// If a single string, the same string appears over all the data points. If
  /// an array of string, the items are mapped in order to the this trace's (x,y)
  /// coordinates.
  ///
  /// To be seen, trace [hoverInfo] must contain a "text" flag.
  final dynamic /* String | Iterable<String> */ hoverText;

  final HoverInfo hoverInfo;

  final HoverLabel hoverLabel;

  final HoverOn hoverOn;

  final LineStyle line;

  final bool connectGaps;

  final bool clipOnAxis;

  final FillType fillType;

  final String fillColor;

  final Marker marker;

  /// Sets the positions of the `text` elements with respects to the (x,y)
  /// coordinates
  ///
  /// Default: middle center
  final TextPosition textPosition;

  /// Sets the text font
  final TextFont textFont;

  // TODO

  Scatter(
      {this.x,
      this.y,
      this.name,
      this.showText: false,
      this.visible: true,
      this.showLegend: true,
      this.legendGroup: '',
      this.opacity: 1.0,
      this.ids,
      /* String | Iterable<String> */ this.text,
      /* String | Iterable<String> */ this.hoverText,
      this.hoverInfo: HoverInfo.all,
      this.hoverLabel,
      this.hoverOn,
      this.line,
      this.connectGaps: false,
      this.clipOnAxis: true,
      this.fillType: FillType.none,
      this.fillColor,
      this.marker,
      this.textPosition: TextPosition.middleCenter,
      this.textFont});

  /// Converts to the format Plotly understands
  Map<String, dynamic> get toDict {
    final ret = <String, dynamic>{
      'x': x.toList(),
      'y': y.toList(),
      'mode': 'markers' + (showText ? '+text' : ''),
      'visible': visible,
    };

    if (name is String) ret['name'] = name;
    if (!showLegend) ret['showlegend'] = showLegend;
    if (legendGroup != null) ret['legendgroup'] = legendGroup;
    if (opacity != null && opacity != 1.0) ret['opacity'] = opacity;
    if (ids != null) ret['ids'] = ids;
    if (text != null) ret['text'] = text;
    if (hoverText != null) ret['hovertext'] = hoverText;
    if (hoverInfo != null && hoverInfo != HoverInfo.all)
      ret['hoverinfo'] = hoverInfo.option;
    if (hoverLabel != null) ret['hoverlable'] = hoverLabel.toDict;
    if (hoverOn != null) ret['hoveron'] = hoverOn.text;
    if (line != null) ret['line'] = line.toDict;
    if (connectGaps) ret['connectgaps'] = connectGaps;
    if (!clipOnAxis) ret['cliponaxis'] = clipOnAxis;
    if (fillType != null && fillType != FillType.none)
      ret['fill'] = fillType.text;
    if (fillColor != null) ret['fillcolor'] = fillColor;
    if (marker != null) ret['marker'] = marker.toDict;
    if (textPosition != null && textPosition != TextPosition.middleCenter)
      ret['textposition'] = textPosition.text;
    if (textFont != null) ret['textfont'] = textFont.toDict;
    return ret;
  }
}

class HoverOn {
  final int id;

  final String text;

  const HoverOn(this.id, this.text);

  static const HoverOn points = const HoverOn(0, 'points');

  static const HoverOn fills = const HoverOn(1, 'fills');

  static const HoverOn pointsNFills = const HoverOn(2, 'points+fills');
}

class LineStyle {
  final String color;

  final double width;

  final LineShape shape;

  final double smoothing;

  /// Sets the dash style of lines.
  ///
  /// Default: solid
  final LineStroke dash;

  /// Dash line length
  final double dashLength;

  /// Simplifies lines by removing nearly-collinear points. When transitioning lines,
  /// it may be desirable to disable this so that the number of points along the
  /// resulting SVG path is unaffected.
  ///
  /// default: True
  final bool simplify;

  LineStyle(
      {this.color,
      this.width: 2.0,
      this.shape: LineShape.linear,
      this.smoothing: 1.0,
      this.dash: LineStroke.solid,
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
    if (dash is LineStroke) {
      if (dash != LineStroke.solid) ret['dash'] = dash.text;
    } else {
      if (dashLength is double) ret['dash'] = dashLength;
    }
    if (simplify is bool && !simplify) ret['simplify'] = 'False';
    return ret;
  }
}

class LineShape {
  final int id;

  final String text;

  const LineShape(this.id, this.text);

  static const LineShape linear = const LineShape(0, 'linear');

  static const LineShape spline = const LineShape(1, 'spline');

  static const LineShape hv = const LineShape(2, 'hv');

  static const LineShape vh = const LineShape(3, 'vh');

  static const LineShape hvh = const LineShape(4, 'hvh');

  static const LineShape vhv = const LineShape(5, 'vhv');
}

class LineStroke {
  final int id;

  final String text;

  const LineStroke(this.id, this.text);

  static const LineStroke solid = const LineStroke(0, 'solid');

  static const LineStroke dot = const LineStroke(1, 'dot');

  static const LineStroke dash = const LineStroke(2, 'dash');

  static const LineStroke longdash = const LineStroke(3, 'longdash');

  static const LineStroke dashdot = const LineStroke(4, 'dashdot');

  static const LineStroke longdashdot = const LineStroke(5, 'longdashdot');
}

class FillType {
  final int id;

  final String text;

  const FillType(this.id, this.text);

  static const FillType none = const FillType(0, 'none');

  static const FillType tozeroy = const FillType(1, 'tozeroy');

  static const FillType tozerox = const FillType(2, 'tozerox');

  static const FillType tonexty = const FillType(3, 'tonexty');

  static const FillType tonextx = const FillType(4, 'tonextx');

  static const FillType toself = const FillType(5, 'toself');

  static const FillType tonext = const FillType(6, 'tonext');
}

class HoverInfo {
  final int id;

  final String option;

  const HoverInfo(this.id, this.option);

  HoverInfo operator |(HoverInfo other) =>
      new HoverInfo(id | other.id, option + '+' + other.option);

  static const HoverInfo none = const HoverInfo(0, 'none');

  static const HoverInfo skip = const HoverInfo(0, 'skip');

  static const HoverInfo x = const HoverInfo(1, 'x');

  static const HoverInfo y = const HoverInfo(2, 'y');

  static const HoverInfo z = const HoverInfo(4, 'z');

  static const HoverInfo text = const HoverInfo(8, 'text');

  static const HoverInfo name = const HoverInfo(16, 'name');

  static const HoverInfo all = const HoverInfo(0x1F, 'all');
}
