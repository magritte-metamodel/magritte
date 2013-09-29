as yet unclassified
buildMorphView
	
	| list |
	list := DropListModel new.
	list
		items: self options;
		displayBlock: [ :e | description displayStringFor: e ];
		setSelectedItem: self value;
		whenSelectedItemChanged: [ :e | self value: e ].
	
	^ list buildWithSpec.