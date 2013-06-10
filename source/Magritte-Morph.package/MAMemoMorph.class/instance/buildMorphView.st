private
buildMorphView
	"The selector #annotation should be #string instead, but we use this one and dispatch since this prevents morphic to draw a thin red border around changed fields. Stupid hack, really, but doesn't work otherwise."

	^ (PluggableTextMorph on: self text: #annotation accept: #string:)
			height: 400;
			hResizing: #spaceFill;
			borderColor: #inset;
			borderWidth: 1