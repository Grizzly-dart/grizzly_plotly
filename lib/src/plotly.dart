library grizzly.plotly;

part 'layout.dart';

part 'traces/area.dart';
part 'traces/bar.dart';
part 'traces/box.dart';
part 'traces/contour.dart';
part 'traces/histogram.dart';
part 'traces/histogram2d.dart';
part 'traces/histogram_2d_contour.dart';
part 'traces/line.dart';
part 'traces/pie.dart';
part 'traces/scatter.dart';

part 'utils/each_color.dart';
part 'utils/each_size.dart';
part 'utils/hover_label.dart';
part 'utils/marker.dart';
part 'utils/text_font.dart';
part 'utils/text_position.dart';

class Figure {
  /// Traces of the plot
  final List<Trace> traces;

  /// Layout information of the plot
  final Layout layout;

  Figure({this.traces: const [], this.layout});

  List<Map<String, dynamic>> get tracesDict =>
      traces.map((t) => t.toDict).toList();

  Map<String, dynamic> get layoutDict => layout.toDict;
}

abstract class Trace {
  /// Converts to the format Plotly understands
  Map<String, dynamic> get toDict;
}
