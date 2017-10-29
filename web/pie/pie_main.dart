import 'package:grizzly_plotly/grizzly_plotly.dart';
import 'package:plotly/plotly.dart';

void main() {
  // Basic Pie Chart
  {
    final fig = new Figure(
      traces: [
        new Pie(
          labels: ['Oxygen', 'Hydrogen', 'Carbon_Dioxide', 'Nitrogen'],
          values: [4500, 2500, 1053, 500],
        ),
      ],
      layout: new Layout(width: 500, height: 400, title: 'Basic Pie Chart'),
    );
    new Plot.id('output1', fig.tracesDict, fig.layoutDict);
  }

  // Styled Pie Chart
  {
    final fig = new Figure(
      traces: [
        new Pie(
          labels: ['Oxygen', 'Hydrogen', 'Carbon_Dioxide', 'Nitrogen'],
          values: [4500, 2500, 1053, 500],
          style: new PieStyle(
              fillColors: ['#FEBFB3', '#E1396C', '#96D38C', '#D0F9B1'],
              line: new LineStyle(color: '#000000', width: 2)),
          hoverInfo: PieTextInfo.label + PieTextInfo.percent,
          textFont: new TextFont(size: 20),
        ),
      ],
      layout: new Layout(width: 500, height: 400, title: 'Styled Pie Chart'),
    );
    new Plot.id('output2', fig.tracesDict, fig.layoutDict);
  }

  // Donut Chart
  {
    final fig = new Figure(
      traces: [
        new Pie(
          labels: [
            "US",
            "China",
            "European Union",
            "Russian Federation",
            "Brazil",
            "India",
            "Rest of World"
          ],
          values: [16, 15, 12, 6, 5, 4, 42],
          domainX: new Extent<num>(0.0, .48),
          name: 'GHG Emissions',
          hoverInfo: PieTextInfo.label + PieTextInfo.percent + PieTextInfo.name,
          hole: .4,
        ),
        new Pie(
          values: [27, 11, 25, 8, 1, 3, 25],
          labels: [
            "US",
            "China",
            "European Union",
            "Russian Federation",
            "Brazil",
            "India",
            "Rest of World"
          ],
          text: 'CO2',
          textPosition: PieTextPosition.inside,
          domainX: new Extent<num>(.52, 1),
          name: 'CO2 Emissions',
          hoverInfo: PieTextInfo.label + PieTextInfo.percent + PieTextInfo.name,
          hole: .4,
        ),
      ],
      layout: new Layout(title: 'Global Emissions 1990-2011', annotations: [
        new Annotation(
          font: new TextFont(size: 20),
          arrow: new Arrow(show: false),
          text: 'GHG',
          x: 0.20,
          y: 0.5,
        ),
        new Annotation(
          font: new TextFont(size: 20),
          arrow: new Arrow(show: false),
          text: 'CO2',
          x: 0.8,
          y: 0.5,
        ),
      ]),
    );
    new Plot.id('output3', fig.tracesDict, fig.layoutDict);
  }
}
