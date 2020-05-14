part of grizzly.plotly;

class Histogram implements Trace {
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
  /// an array of string, the items are mapped in order to the this trace's
  /// (x,y) coordinates.
  ///
  /// If trace [hoverInfo] contains a "text" flag and [hoverText] is not set,
  /// these elements will be seen in the hover labels.
  final dynamic /* String | Iterable<String> */ text;

  /// Sets the orientation of the bars
  ///
  /// If [true], plots histogram vertically.
  /// If [false], plots histogram horizontally.
  final bool vertical;

  /// Specifies the binning function used for this histogram trace.
  ///
  /// If [HistFunc.count], the histogram values are computed by counting the
  /// number of values lying inside each bin.
  ///
  /// If [HistFunc.sum], the histogram values are computed using the sum of the
  /// values lying inside each bin respectively.
  ///
  /// If [HistFunc.avg], the histogram values are computed using the avg of the
  /// values lying inside each bin respectively.
  ///
  /// If [HistFunc.min], the histogram values are computed using the min of the
  /// values lying inside each bin respectively.
  ///
  /// If [HistFunc.max], the histogram values are computed using the max of the
  /// values lying inside each bin respectively.
  ///
  /// Default: [HistFunc.count].
  final HistFunc histFunc;

  /// Specifies the type of normalization used for this histogram trace.
  ///
  /// If [HistNorm.none], the span of each bar corresponds to the number of
  /// occurrences (i.e. the number of data points lying inside the bins).
  ///
  /// If [HistNorm.percent], the span of each bar corresponds to the percentage
  /// of occurrences with respect to the total number of sample points
  /// (here, the sum of all bin HEIGHTS equals 100%).
  ///
  /// If [HistNorm.probability], the span of each bar corresponds to the fraction
  /// of occurrences with respect to the total number of sample points
  /// (here, the sum of all bin HEIGHTS equals 1).
  ///
  /// If [HistNorm.density], the span of each bar corresponds to the number of
  /// occurrences in a bin divided by the size of the bin interval (here, the
  /// sum of all bin AREAS equals the total number of sample points).
  ///
  /// If [HistNorm.probabilityDensity], the area of each bar corresponds to the
  /// probability that an event will fall into the corresponding bin (here, the
  /// sum of all bin AREAS equals 1).
  final HistNorm histNorm;

  /// Configures plotting of cumulative histogram
  final HistCumulative cumulative;

  /// Determines whether or not the x axis bin attributes are picked by an
  /// algorithm.
  ///
  /// Note that this should be set to [false] if you want to manually set the
  /// number of bins using the attributes in xbins.
  final bool autoBinX;

  /// Specifies the maximum number of desired bins.
  ///
  /// This value will be used in an algorithm that will decide the optimal bin
  /// size such that the histogram best visualizes the distribution of the data.
  ///
  /// Default: 0
  final int nBinsX;

  /// Manually set bins for X-axis
  final HistBin xBins;

  /// Determines whether or not the y axis bin attributes are picked by an
  /// algorithm.
  ///
  /// Note that this should be set to False if you want to manually set the
  /// number of bins using the attributes in ybins.
  final bool autoBinY;

  /// Specifies the maximum number of desired bins.
  ///
  /// This value will be used in an algorithm that will decide the optimal bin
  /// size such that the histogram best visualizes the distribution of the data.
  ///
  /// Default: 0
  final int nBinsY;

  /// Manually set bins for X-axis
  final HistBin yBins;

  /// Configure marker
  final BarMarker marker;

  Histogram({
    this.x,
    this.y,
    this.name,
    this.visible: true,
    this.showLegend: true,
    this.legendGroup: '',
    this.opacity: 1.0,
    this.ids,
    /* String | Iterable<String> */ this.text,
    this.hoverInfo: HoverInfo.all,
    this.hoverLabel,
    this.vertical: true,
    this.histFunc: HistFunc.count,
    this.histNorm: HistNorm.none,
    this.cumulative,
    this.autoBinX,
    this.nBinsX: 0,
    this.xBins,
    this.autoBinY,
    this.nBinsY: 0,
    this.yBins,
    this.marker,
  });

  @override
  Map<String, dynamic> get toDict {
    final ret = <String, dynamic>{
      'visible': visible,
      'orientation': vertical ? 'v' : 'h',
      'type': 'histogram',
    };
    if (x != null) ret['x'] = x.toList();
    if (y != null) ret['y'] = y.toList();

    if (name is String) ret['name'] = name;
    if (!showLegend) ret['showlegend'] = showLegend;
    if (legendGroup != null) ret['legendgroup'] = legendGroup;
    if (opacity != null && opacity != 1.0) ret['opacity'] = opacity;
    if (ids != null) ret['ids'] = ids;
    if (text != null) ret['text'] = text;
    if (hoverInfo != null && hoverInfo != HoverInfo.all)
      ret['hoverinfo'] = hoverInfo.option;
    if (hoverLabel != null) ret['hoverlable'] = hoverLabel.toDict;
    if (histFunc != HistFunc.count) ret['histfunc'] = histFunc.text;
    if (histNorm != HistNorm.none) ret['histnorm'] = histNorm.text;
    if (cumulative != null) ret['cumulative'] = cumulative.toDict;

    if (autoBinX != null) ret['autobinx'] = autoBinX;
    if (nBinsX != null) ret['nbinx'] = nBinsX;
    if (xBins != null) ret['xbins'] = xBins.toDict;

    if (autoBinY != null) ret['autobiny'] = autoBinY;
    if (nBinsY != null) ret['nbiny'] = nBinsY;
    if (yBins != null) ret['ybins'] = yBins.toDict;

    if (marker != null) ret['marker'] = marker.toDict;
    return ret;
  }
}

class HistFunc {
  final int id;

  final String text;

  const HistFunc(this.id, this.text);

  static const HistFunc count = const HistFunc(0, 'count');

  static const HistFunc sum = const HistFunc(1, 'sum');

  static const HistFunc avg = const HistFunc(2, 'avg');

  static const HistFunc min = const HistFunc(3, 'min');

  static const HistFunc max = const HistFunc(4, 'max');
}

class HistNorm {
  final int id;

  final String text;

  const HistNorm(this.id, this.text);

  static const HistNorm none = const HistNorm(0, '');

  static const HistNorm percent = const HistNorm(1, 'percent');

  static const HistNorm probability = const HistNorm(2, 'probability');

  static const HistNorm density = const HistNorm(3, 'density');

  static const HistNorm probabilityDensity =
      const HistNorm(4, 'probability density');
}

class HistCumulative {
  final bool increasing;

  final HistBinInclude includeCurrentBin;

  HistCumulative(
      {this.increasing, this.includeCurrentBin: HistBinInclude.include});

  Map<String, dynamic> get toDict {
    final ret = <String, dynamic>{
      'enabled': true,
    };
    if (!increasing) ret['direction'] = 'decreasing';
    if (includeCurrentBin != HistBinInclude.include)
      ret['currentbin'] = includeCurrentBin.text;
    return ret;
  }
}

class HistBinInclude {
  final int id;

  final String text;

  const HistBinInclude(this.id, this.text);

  static const HistBinInclude include = const HistBinInclude(0, 'include');

  static const HistBinInclude exclude = const HistBinInclude(1, 'exclude');

  static const HistBinInclude half = const HistBinInclude(2, 'half');
}

class HistBin {
  /// Sets the starting value for the x axis bins
  final double start;

  /// Sets the end value for the x axis bins
  final double end;

  /// Sets the step in-between value each x axis bin
  final double size;

  HistBin(this.start, this.end, this.size);

  Map<String, dynamic> get toDict => <String, dynamic>{
        'start': start,
        'end': end,
        'size': size,
      };
}
