part of grizzly.plotly;

// TODO incomplete
class Box {
  /// X-axis data
  final Iterable<num> x;

  /// Y-axis data
  final Iterable<num> y;

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

  final HoverInfo hoverInfo;

  final HoverLabel hoverLabel;

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

  final BarMarker marker;

  /// Sets the positions of the `text` elements with respects to the (x,y)
  /// coordinates
  ///
  /// Default: middle center
  final TextPosition textPosition;

  /// Sets the text font
  final TextFont textFont;

  /// Sets the text font
  final TextFont insidTextFont;

  /// Sets the text font
  final TextFont outsideTextFont;

  final BarConstrainText constrainText;

  final bool vertical;

  final double base;

  final double offset;

  final double width;

  Box({
    this.x,
    this.y,
    this.name,
    this.visible: true,
    this.showLegend: true,
    this.legendGroup: '',
    this.opacity: 1.0,
    this.ids,
    /* String | Iterable<String> */ this.text,
    /* String | Iterable<String> */ this.hoverText,
    this.hoverInfo: HoverInfo.all,
    this.hoverLabel,
    this.marker,
    this.textPosition: TextPosition.middleCenter,
    this.textFont,
    this.insidTextFont,
    this.outsideTextFont,
    this.constrainText: BarConstrainText.both,
    this.vertical: true,
    this.base,
    this.offset,
    this.width,
  });

  /// Converts to the format Plotly understands
  Map<String, dynamic> get toDict {
    final ret = <String, dynamic>{
      'x': x.toList(),
      'y': y.toList(),
      'visible': visible,
      'orientation': vertical ? 'v' : 'h',
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
    if (marker != null) ret['marker'] = marker.toDict;
    if (textPosition != null && textPosition != TextPosition.middleCenter)
      ret['textposition'] = textPosition.text;
    if (textFont != null) ret['textfont'] = textFont.toDict;
    if (insidTextFont != null) ret['insidetextfont'] = insidTextFont.toDict;
    if (outsideTextFont != null)
      ret['outsidetextfont'] = outsideTextFont.toDict;
    if (constrainText != null && constrainText != BarConstrainText.both)
      ret['constraintext'] = constrainText.text;
    if (base != null) ret['base'] = base;
    if (offset != null) ret['offset'] = offset;
    if (width != null) ret['width'] = width;

    return ret;
  }
}
