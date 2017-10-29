part of grizzly.plotly;

/// Sets different color for each individual element
class EachColor {
  /// The colors
  final List<String> colors;

  final Map<double, String> colorScale;

  /// It controls whether the range of colors in [colorScale] is mapped to the range
  /// of values in the [colors] array ([cauto]: True), or the `cmin`/`cmax` values
  /// ([cauto]: False).
  ///
  /// Default: false
  final bool cauto;

  /// Sets the upper bound of the color domain. Value should be associated to
  /// the [colors] array index, and if set, [cmin] must
  /// be set as well.
  final double cmax;

  /// Sets the lower bound of the color domain. Value should be associated to
  /// the [colors] array index, and if set, [cmax] must
  /// be set as well.
  final double cmin;

  /// Determines whether the colorscale is a default palette ([autoScale]: True)
  /// or the palette determined by [colorscale].
  ///
  /// In case [colorscale] is unspecified or [autoScale] is True, the default palette
  /// will be chosen according to whether numbers in the [colors] array are all positive,
  /// all negative or mixed.
  final bool autoScale;

  /// Reverses the color mapping if True
  ///
  /// `cmin` will correspond to the last color in the array and `cmax` will
  /// correspond to the first color
  ///
  /// Default: false
  final bool reverseScale;

  EachColor(this.colors,
      {this.colorScale,
      this.cauto,
      this.cmax,
      this.cmin,
      this.autoScale,
      this.reverseScale: false});

  List get colorScaleList => [];
}
