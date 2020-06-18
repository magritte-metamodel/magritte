private
buildMorphView

	| table scrollPane |
	table := self rectangleMorph
		listDirection: #topToBottom;
		yourself.
	self value ifNotNil: [ :v | v do: [ :e | MAElementRow addMorphFor: e of: self to: table ] ].
	self magritteDescription isDefinitive
		ifFalse: [ self addSelectListTo: table ].
	scrollPane := GeneralScrollPane new
			changeScrollerTableLayout;
			hResizing: #shrinkWrap;
			yourself.
	table computeBounds. "Layout so we know the height, which is needed below"
	scrollPane
		height: (table height min: 200);
		scrollTarget: table.
	^ scrollPane