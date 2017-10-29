part of grizzly.plotly;

class Layout {
	final num width;

	final num height;

	final String title;

	Layout(this.width, this.height, {this.title});

	Map<String, dynamic> get toDict => {
		'width': width,
		'height': height,
		'title': title,
	};
}