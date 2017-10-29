part of grizzly.plotly;

/// Sets different size for each individual element
class EachSize {
  /// Sets the marker size (in px)
  final List<double> sizes;

  /// Sets the scale factor used to determine the rendered size of marker points.
  /// Use with [min] and [isDiameter]
  final double ref;

  /// Sets the minimum size (in px) of the rendered marker points
  final double min;

  /// Sets the rule for which the data in [sizes] is converted to pixels
  ///
  /// Diameter when true, area when false.
  ///
  /// Default: true
  final bool isDiameter;

  EachSize(this.sizes, {this.ref: 1.0, this.min: 0.0, this.isDiameter: true});
}
