part of grizzly.plotly;

class Layout {
  final num width;

  final num height;

  final String title;

  final List<Annotation> annotations;

  Layout({this.width, this.height, this.title, this.annotations});

  Map<String, dynamic> get toDict {
    final ret = <String, dynamic>{};
    if (width != null) ret['width'] = width;
    if (height != null) ret['height'] = height;
    if (title != null) ret['title'] = title;
    if (annotations != null)
      ret['annotations'] = annotations.map((a) => a.toDict).toList();
    return ret;
  }
}
