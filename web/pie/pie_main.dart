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

  // Pie Chart Subplots
  {
    final fig = new Figure(
      traces: [
        new Pie(
          labels: ['1st', '2nd', '3rd', '4th', '5th'],
          values: [38, 27, 18, 10, 7],
          domainX: new Extent<num>(0.0, .48),
          domainY: new Extent<num>(0.0, .49),
          name: 'Starry Night',
          hoverInfo: PieTextInfo.label + PieTextInfo.percent + PieTextInfo.name,
          textInfo: PieTextInfo.none,
          style: new PieStyle(fillColors: [
            'rgb(56, 75, 126)',
            'rgb(18, 36, 37)',
            'rgb(34, 53, 101)',
            'rgb(36, 55, 57)',
            'rgb(6, 4, 4)'
          ]),
        ),
        new Pie(
          labels: ['1st', '2nd', '3rd', '4th', '5th'],
          values: [28, 26, 21, 15, 10],
          domainX: new Extent<num>(0.52, 1),
          domainY: new Extent<num>(0.0, .49),
          name: 'Sunflowers',
          hoverInfo: PieTextInfo.label + PieTextInfo.percent + PieTextInfo.name,
          textInfo: PieTextInfo.none,
          style: new PieStyle(fillColors: [
            'rgb(177, 127, 38)',
            'rgb(205, 152, 36)',
            'rgb(99, 79, 37)',
            'rgb(129, 180, 179)',
            'rgb(124, 103, 37)'
          ]),
        ),
        new Pie(
          labels: ['1st', '2nd', '3rd', '4th', '5th'],
          values: [38, 19, 16, 14, 13],
          domainX: new Extent<num>(0, .48),
          domainY: new Extent<num>(.51, 1),
          name: 'Irises',
          hoverInfo: PieTextInfo.label + PieTextInfo.percent + PieTextInfo.name,
          textInfo: PieTextInfo.none,
          style: new PieStyle(fillColors: [
            'rgb(33, 75, 99)',
            'rgb(79, 129, 102)',
            'rgb(151, 179, 100)',
            'rgb(175, 49, 35)',
            'rgb(36, 73, 147)'
          ]),
        ),
        new Pie(
          labels: ['1st', '2nd', '3rd', '4th', '5th'],
          values: [31, 24, 19, 18, 8],
          domainX: new Extent<num>(0.52, 1),
          domainY: new Extent<num>(.51, 1),
          name: 'The Night Café',
          hoverInfo: PieTextInfo.label + PieTextInfo.percent + PieTextInfo.name,
          textInfo: PieTextInfo.none,
          style: new PieStyle(fillColors: [
            'rgb(146, 123, 21)',
            'rgb(177, 180, 34)',
            'rgb(206, 206, 40)',
            'rgb(175, 51, 21)',
            'rgb(35, 36, 21)'
          ]),
        ),
      ],
      layout: new Layout(
        title: 'Van Gogh: 5 Most Prominent Colors Shown Proportionally',
        showLegend: false,
      ),
    );
    new Plot.id('output4', fig.tracesDict, fig.layoutDict);
  }
}
