private
buildMorphView
	^ (PluggableListMorph on: self list: #strings primarySelection: #selected changePrimarySelection: #selected: listSelection: #selectionAt: changeListSelection: #selectionAt:put: menu: nil)
		hResizing: #spaceFill;
		borderColor: #inset;
		borderWidth: 1;
		beMultipleSelection;
		yourself