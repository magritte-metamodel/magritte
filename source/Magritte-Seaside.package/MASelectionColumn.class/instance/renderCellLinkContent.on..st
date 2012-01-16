rendering
renderCellLinkContent: anObject on: html
	| selected |
	selected := self isSelected: anObject.
	html anchor 
		class: (selected ifTrue: [ 'selected' ]);
		callback: [ self selectRow: anObject value: selected not ];
		with: (selected
			ifTrue: [ self stringSelected ]
			ifFalse: [ self stringDeselected ])