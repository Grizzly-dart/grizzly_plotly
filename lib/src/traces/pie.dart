part of grizzly.plotly;

/// Encloses the data for a scatter trace
class Pie implements Trace {
  final Iterable<String> labels;

  final Iterable<num> values;

  /// Name of the trace
  final String name;

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

  /// Determines which trace information appear on hover.
  ///
  /// If [none] or [skip] are set, no information is displayed upon hovering.
  /// if [none] is set, click and hover events are still fired.
  ///
  /// Default: [PieTextInfo.all]
  final PieTextInfo hoverInfo;

  final HoverLabel hoverLabel;

  /// If there are multiple pies that should be sized according to their totals,
  /// link them by providing a non-empty group id here shared by every trace
  /// in the same group.
  final String scaleGroup;

  /// Determines which trace information appear on the graph as text
  final PieTextInfo textInfo;

  /// Specifies the location of the [textInfo]
  final PieTextPosition textPosition;

  /// Sets the font used for [textInfo]
  final TextFont textFont;

  final TextFont insideTextFont;

  final TextFont outsideTextFont;

  /// Sets the horizontal domain of this pie trace (in plot fraction).
  final Extent<num> domainX;

  /// Sets the vertical domain of this pie trace (in plot fraction).
  final Extent<num> domainY;

  /// Sets the fraction of the radius to cut out of the pie. Use this to make a
  /// donut chart.
  ///
  /// Default: 0
  final num hole;

  /// Determines whether or not the sectors are reordered from largest to smallest.
  ///
  /// Default: true
  final bool sort;

  /// Specifies the direction at which succeeding sectors follow one another.
  ///
  /// If true, clockwise.
  /// If false, counterclockwise.
  ///
  /// Default: true
  final bool direction;

  /// Instead of the first slice starting at 12 o'clock, rotate to some other angle.
  ///
  /// Default: 0
  final num rotation;

  /// Sets the fraction of larger radius to pull the sectors out from the center.
  /// This can be a constant to pull all slices apart from each other equally or
  /// an array to highlight one or more slices.
  final dynamic /* num | Iterable<num> */ pull;

  final PieStyle style;

  Pie({
    this.labels,
    this.values,
    this.name,
    this.visible: true,
    this.showLegend: true,
    this.legendGroup: '',
    this.opacity: 1.0,
    this.ids,
    /* String | Iterable<String> */ this.text,
    /* String | Iterable<String> */ this.hoverText,
    this.hoverInfo: PieTextInfo.all,
    this.hoverLabel,
    this.scaleGroup,
    this.textInfo, // TODO default
    this.textPosition: PieTextPosition.auto,
    this.textFont,
    this.insideTextFont,
    this.outsideTextFont,
    this.domainX: const Extent<double>(0.0, 1.0),
    this.domainY: const Extent<double>(0.0, 1.0),
    this.hole: 0,
    this.sort: true,
    this.direction: false,
    this.rotation: 0,
    this.pull: 0,
    this.style,
  });

  @override
  Map<String, dynamic> get toDict {
    final ret = <String, dynamic>{
      'labels': labels,
      'values': values,
      'visible': visible,
      'type': 'pie',
    };

    if (name is String) ret['name'] = name;
    if (!showLegend) ret['showlegend'] = showLegend;
    if (legendGroup != null) ret['legendgroup'] = legendGroup;
    if (opacity != null && opacity != 1.0) ret['opacity'] = opacity;
    if (ids != null) ret['ids'] = ids;
    if (text != null) ret['text'] = text;
    if (hoverText != null) ret['hovertext'] = hoverText;
    if (hoverInfo != PieTextInfo.all) ret['hoverinfo'] = hoverInfo.option;
    if (hoverLabel != null) ret['hoverlable'] = hoverLabel.toDict;
    if (scaleGroup != null) ret['scalegroup'] = scaleGroup;
    if (textInfo != null) ret['textinfo'] = textInfo.option;
    if (textPosition != PieTextPosition.auto)
      ret['textposition'] = textPosition.text;
    if (textFont != null) ret['textfont'] = textFont.toDict;
    if (insideTextFont != null) ret['insidetextfont'] = insideTextFont.toDict;
    if (outsideTextFont != null)
      ret['outsidetextfont'] = outsideTextFont.toDict;
    if (domainX != _zeroTo1) {
      ret['domain'] = <String, dynamic>{};
      ret['domain']['x'] = domainX.toList();
    }
    if (domainY != _zeroTo1) {
      ret['domain'] ??= <String, dynamic>{};
      ret['domain']['y'] = domainY.toList();
    }
    if (hole != 0) ret['hole'] = hole;
    if (!sort) ret['sort'] = sort;
    ret['direction'] = direction ? 'clockwise' : 'counterclockwise';
    if (rotation != 0) ret['rotation'] = rotation;
    if (pull != 0) ret['pull'] = pull;
    if (style != null) ret['marker'] = style.toDict;

    return ret;
  }

  static const Extent<double> _zeroTo1 = const Extent<double>(0.0, 1.0);
}

class PieTextInfo {
  final int id;

  final String option;

  const PieTextInfo(this.id, this.option);

  PieTextInfo operator |(PieTextInfo other) =>
      new PieTextInfo(id | other.id, option + '+' + other.option);

  PieTextInfo operator +(PieTextInfo other) => this | other;

  static const PieTextInfo none = const PieTextInfo(0, 'none');

  static const PieTextInfo skip = const PieTextInfo(0, 'skip');

  static const PieTextInfo label = const PieTextInfo(1, 'label');

  static const PieTextInfo text = const PieTextInfo(2, 'text');

  static const PieTextInfo value = const PieTextInfo(4, 'value');

  static const PieTextInfo percent = const PieTextInfo(8, 'percent');

  static const PieTextInfo name = const PieTextInfo(16, 'name');

  static const PieTextInfo all =
      const PieTextInfo(0x1F, 'label+text+value+percent+name');
}

class PieTextPosition {
  final int id;

  final String text;

  const PieTextPosition(this.id, this.text);

  static const PieTextPosition none = const PieTextPosition(0, 'none');

  static const PieTextPosition inside = const PieTextPosition(1, 'inside');

  static const PieTextPosition outside = const PieTextPosition(2, 'outside');

  static const PieTextPosition auto = const PieTextPosition(3, 'auto');
}

/// Styles the pie
class PieStyle {
  /// Sets the color of each sector of this pie chart. If not specified, the
  /// default trace color set is used to pick the sector colors.
  final List<String> fillColors;

  /// Styles the border lines of the each sector
  final LineStyle line;

  PieStyle({this.fillColors, this.line});

  Map<String, dynamic> get toDict {
    final ret = <String, dynamic>{};
    if (fillColors != null) ret['colors'] = fillColors;
    if (line != null) ret['line'] = line.toDict;
    return ret;
  }
}
