private
buildCommands
	| commands |
	commands := self rectangleMorph
		listDirection: #leftToRight;
		cellInset: self cellInset;
		yourself.
	container magritteDescription isDefinitive ifFalse: [
		commands
			addMorphBack: (self buildButton: #edit);
			addMorphBack: (self buildButton: #remove) ].
	container magritteDescription isOrdered ifTrue: [
		self shouldBeImplemented.
		"commands
			addCommandOn: self selector: #up: text: 'up';
			addCommandOn: self selector: #down: text: 'down'" ].
	^ commands