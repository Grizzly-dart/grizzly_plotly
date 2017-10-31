part of grizzly.plotly;

class Layout {
  final num width;

  final num height;

  final String title;

  final List<Annotation> annotations;

  /// Determines whether or not a legend is drawn.
  final bool showLegend;

  Layout(
      {this.width,
      this.height,
      this.title,
      this.annotations,
      this.showLegend: true});

  Map<String, dynamic> get toDict {
    final ret = <String, dynamic>{};
    if (width != null) ret['width'] = width;
    if (height != null) ret['height'] = height;
    if (title != null) ret['title'] = title;
    if (annotations != null)
      ret['annotations'] = annotations.map((a) => a.toDict).toList();
    if (!showLegend) ret['showlegend'] = showLegend;
    return ret;
  }
}
