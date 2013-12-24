as yet unclassified
buildMorphView
	
	| list |
	list := DropListModel new.
	list
		items: self options;
		displayBlock: [ :e | 
			e
				ifNil: [ '' ]
				ifNotNil: [ description displayStringFor: e ] ];
		setSelectedItem: self value;
		whenSelectedItemChanged: [ :e | self value: e ].
	
	^ list buildWithSpec.