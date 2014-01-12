private-building
buildMorphView
	
	| list |
	list := DropListModel new.
	list
		items: self options;
		displayBlock: [ :e | 
			e
				ifNil: [ '' ]
				ifNotNil: [ self magritteDescription reference toString: e ] ];
		setSelectedItem: self value;
		whenSelectedItemChanged: [ :e | self value: e ].
	
	^ list buildWithSpec.