part of grizzly.plotly;

/// An annotation is a text element that can be placed anywhere in the plot.
///
/// It can be positioned with respect to relative coordinates in the plot or with
/// respect to the actual data coordinates of the graph.
///
/// Annotations can be shown with or without an arrow.
class Annotation {
  /// Determines whether or not this annotation is visible.
  final bool visible;

  /// Sets the text associated with this annotation.
  ///
  /// Uses a subset of HTML tags to do things like newline (<br>), bold (<b></b>),
  /// italics (<i></i>), hyperlinks (<a href='...'></a>). Tags <em>, <sup>,
  /// <sub> <span> are also supported.
  final String text;

  /// Sets the angle at which the `text` is drawn with respect to the horizontal.
  ///
  /// Default: 0
  final num textAngle;

  /// Sets the annotation text font.
  final TextFont font;

  /// Sets an explicit width for the text box.
  ///
  /// null (default) lets the text set the box width.
  ///
  /// Wider text will be clipped.
  ///
  /// There is no automatic wrapping; use <br> to start a new line.
  final num width;

  /// Sets an explicit height for the text box.
  ///
  /// null (default) lets the text set the box height.
  ///
  /// Taller text will be clipped.
  final num height;

  /// Sets the opacity of the annotation (text + arrow).
  final num opacity;

  /// Sets the horizontal alignment of the [text] within the box.
  ///
  /// Has an effect only if [text] spans more two or more lines (i.e. [text]
  /// contains one or more <br> HTML tags) or if an explicit width is set to
  /// override the text width.
  ///
  /// Default: [HAlign.center]
  final HAlign align;

  /// Sets the vertical alignment of the [text] within the box.
  ///
  /// Has an effect only if an explicit height is set to override the text height.
  ///
  /// Default: [VAlign.middle]
  final VAlign vAlign;

  /// Sets the background color of the annotation.
  final String bgColor;

  /// Sets the color of the border enclosing the annotation [text].
  final String borderColor;

  /// Sets the padding (in px) between the [text] and the enclosing border.
  ///
  /// Default: 1
  final num borderPad;

  /// Sets the width (in px) of the border enclosing the annotation [text].
  final num borderWidth;

  /// Configures arrow style for this annotation
  final Arrow arrow;

  /// Sets a distance, in pixels, to move the arrowhead away from the position
  /// it is pointing at, for example to point at the edge of a marker independent
  /// of zoom.
  ///
  /// Note that this shortens the arrow from the [ax] / [ay] vector, in contrast
  /// to [xShift] / [yShift] which moves everything by this amount.
  ///
  /// Default: 0
  final num standOff;

  /// Sets the x component of the arrow tail about the arrow head.
  ///
  /// If [axref] is 'pixel', a positive (negative) component corresponds to an
  /// arrow pointing from right to left (left to right).
  ///
  /// If [axref] is an axis, this is an absolute value on that axis, like [x],
  /// NOT a relative value.
  final num ax;

  /// Sets the y component of the arrow tail about the arrow head.
  ///
  /// If [ayref] is 'pixel', a positive (negative) component corresponds to an
  /// arrow pointing from bottom to top (top to bottom).
  ///
  /// If [ayref] is an axis, this is an absolute value on that axis, like [y],
  /// NOT a relative value.
  final num ay;

  // TODO axref

  // TODO ayref

  // TODO xref

  final num x;

  // TODO xanchor

  final num xShift;

  // TODO yref

  final num y;

  // TODO yanchor

  final num yShift;

  // TODO clicktoshow

  final num xClick;

  final num yClick;

  /// Sets text to appear when hovering over this annotation.
  ///
  /// If omitted or blank, no hover label will appear.
  final String hoverText;

  /// Configures the style of hover label
  final HoverLabel hoverLabel;

  final bool captureEvents;

  Annotation({
    this.visible: true,
    @required this.text,
    this.textAngle: 0,
    this.font,
    this.width,
    this.height,
    this.opacity: 1,
    this.align: HAlign.center,
    this.vAlign: VAlign.middle,
    this.bgColor: 'rgba(0,0,0,0)',
    this.borderColor: 'rgba(0,0,0,0)',
    this.borderPad: 1,
    this.borderWidth: 1,
    this.arrow,
    this.standOff: 0,
    this.ax,
    this.ay,
    this.x,
    this.xShift: 0,
    this.y,
    this.yShift: 0,
    this.xClick,
    this.yClick,
    this.hoverText,
    this.hoverLabel,
    this.captureEvents: true,
  });

  Map<String, dynamic> get toDict {
    final ret = <String, dynamic>{
      'text': text,
    };
    if (!visible) ret['visible'] = visible;
    if (textAngle != 0) ret['textangle'] = textAngle;
    if (font != null) ret['font'] = font.toDict;
    if (width != null) ret['width'] = width;
    if (height != null) ret['height'] = height;
    if (opacity != 1) ret['opacity'] = opacity;
    if (align != HAlign.center) ret['align'] = align.text;
    if (vAlign != VAlign.middle) ret['valign'] = vAlign.text;
    if (bgColor != null) ret['bgcolor'] = bgColor;
    if (borderColor != null) ret['bordercolor'] = borderColor;
    if (borderPad != 1) ret['borderpad'] = borderPad;
    if (borderWidth != 1) ret['borderwidth'] = borderWidth;
    if (arrow != null) {
      if (!arrow.show) ret['showarrow'] = arrow.show;
      if (arrow.color != null) ret['arrowcolor'] = arrow.color;
      if (arrow.head != 1) ret['arrowhead'] = arrow.head;
      if (arrow.size != 1) ret['arrowsize'] = arrow.size;
      if (arrow.width != null) ret['arrowwidth'] = arrow.width;
    }
    if (standOff != 0) ret['standoff'] = standOff;
    if (ax != null) ret['ax'] = ax;
    if (ay != null) ret['ay'] = ay;
    if (x != null) ret['x'] = x;
    if (y != null) ret['y'] = y;
    if (xShift != 0) ret['xshift'] = xShift;
    if (yShift != 0) ret['yshift'] = yShift;
    if (xClick != null) ret['xclick'] = xClick;
    if (yClick != null) ret['yclick'] = yClick;
    if (hoverText != null) ret['hovertext'] = hoverText;
    if (hoverLabel != null) ret['hoverlabel'] = hoverLabel.toDict;
    ret['captureevents'] = captureEvents;
    return ret;
  }
}

class Arrow {
  final bool show;

  final String color;

  final int head; // TODO needs enumeration?

  final num size;

  final num width;

  Arrow({this.show: true, this.color, this.head: 1, this.size: 1, this.width});
}

class HAlign {
  final int id;

  final String text;

  const HAlign(this.id, this.text);

  static const HAlign left = const HAlign(0, 'left');

  static const HAlign center = const HAlign(1, 'center');

  static const HAlign right = const HAlign(2, 'right');
}

class VAlign {
  final int id;

  final String text;

  const VAlign(this.id, this.text);

  static const VAlign top = const VAlign(0, 'top');

  static const VAlign middle = const VAlign(1, 'middle');

  static const VAlign bottom = const VAlign(2, 'bottom');
}
