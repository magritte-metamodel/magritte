prototypes
buttonMorph: aSelector
	| button |
	button := PluggableButtonMorph
		on: self
		getState: #buttonState
		action: aSelector.
	button
		label: aSelector;
		hResizing: #spaceFill;
		shortcutCharacter: aSelector first.
	^ button