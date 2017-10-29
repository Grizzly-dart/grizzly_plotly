import 'package:grizzly_plotly/grizzly_plotly.dart';
import 'package:plotly/plotly.dart';

void main() {
  final fig = new Figure(
    traces: [
      new Scatter(
        x: [1, 2, 3, 4],
        y: [10, 15, 13, 17],
        visible: true,
      ),
      new Line(
        x: [2, 3, 4, 5],
        y: [16, 5, 11, 9],
        visible: true,
        marker: new Marker(symbol: MarkerSymbol.triangleUp),
      ),
      new Scatter(
        x: [1, 2, 3, 4],
        y: [12, 9, 15, 12],
        visible: false,
      ),
    ],
    layout: new Layout(500, 400, title: 'Scatter plot'),
  );

  print(fig.tracesDict);

  final plt = new Plot.id('output', fig.tracesDict, fig.layoutDict);
}
