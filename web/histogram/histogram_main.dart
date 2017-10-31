import 'package:grizzly_plotly/grizzly_plotly.dart';
import 'package:plotly/plotly.dart';
import 'package:grizzly_stats/grizzly_stats.dart';

void main() {
  final rands = new List<double>.generate(10000, (_) => randn);

  final fig = new Figure(
    traces: [
      new Histogram(
        x: rands,
        visible: true,
      ),
    ],
    layout: new Layout(width: 500, height: 400, title: 'Scatter plot'),
  );

  print(fig.tracesDict);

  final plt = new Plot.id('output1', fig.tracesDict, fig.layoutDict);
}
