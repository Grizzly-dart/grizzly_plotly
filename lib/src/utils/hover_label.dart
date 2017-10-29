part of grizzly.plotly;

class HoverLabel {
  /// Sets the background color of the hover labels for this trace
  final String bgColor;

  final String borderColor;

  final TextFont font;

  /// Sets the length (in number of characters) of the trace name in the hover
  /// labels for this trace.
  ///
  /// -1 shows the whole name regardless of length.
  /// 0-3 shows the first 0-3 characters, and an integer >3 will show the whole
  /// name if it is less than that many characters, but if it is longer,
  /// will truncate to `namelength - 3` characters and add an ellipsis.
  final int nameLength;

  HoverLabel({this.bgColor, this.borderColor, this.font, this.nameLength});

  Map<String, dynamic> get toDict {
    final ret = <String, dynamic>{};
    if (bgColor != null) ret['bgcolor'] = bgColor;
    if (borderColor != null) ret['bordercolor'] = borderColor;
    if (font != null) ret['font'] = font.toDict;
    if (nameLength != null) ret['namelength'] = nameLength;
    return ret;
  }
}
