part of grizzly.plotly;

/// Encloses the data for a scatter trace
class Line extends Scatter implements Trace {
  Line(
      {Iterable<num> x,
      Iterable<num> y,
      String name,
      bool showText: false,
      bool visible: true,
      bool showLegend: true,
      String legendGroup: '',
      double opacity: 1.0,
      List<String> ids,
      /* String | Iterable<String> */ text,
      /* String | Iterable<String> */ hoverText,
      HoverLabel hoverLabel,
      HoverOn hoverOn,
      HoverInfo hoverInfo: HoverInfo.all,
      CurveStyle line,
      bool connectGaps: false,
      bool clipOnAxis: true,
      FillType fillType: FillType.none,
      String fillColor,
      Marker marker,
      TextPosition textPosition: TextPosition.middleCenter,
      TextFont textFont})
      : super(
            x: x,
            y: y,
            name: name,
            showText: showText,
            visible: visible,
            showLegend: showLegend,
            legendGroup: legendGroup,
            opacity: opacity,
            ids: ids,
            text: text,
            hoverText: hoverText,
            hoverOn: hoverOn,
            hoverInfo: hoverInfo,
            hoverLabel: hoverLabel,
            line: line,
            connectGaps: connectGaps,
            clipOnAxis: clipOnAxis,
            fillType: fillType,
            fillColor: fillColor,
            marker: marker,
            textPosition: textPosition,
            textFont: textFont);

  /// Converts to the format Plotly understands
  Map<String, dynamic> get toDict {
    final ret = super.toDict;
    ret['mode'] = 'lines' + (showText ? '+text' : '');
    return ret;
  }
}
