private
buildMorphView
	^ (PluggableListMorph on: self list: #strings selected: #selected changeSelected: #selected:)
		hResizing: #spaceFill;
		borderColor: #inset;
		borderWidth: 1;
		yourself