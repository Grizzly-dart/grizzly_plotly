part of grizzly.plotly;

class TextFont {
	final String family;

	final int size;

	final String color;

	TextFont({this.family, this.size, this.color});

	Map<String, dynamic> get toDict => {
		'family': family,
		'size': size,
		'color': color,
	};
}
