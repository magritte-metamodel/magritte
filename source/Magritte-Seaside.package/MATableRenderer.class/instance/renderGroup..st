rendering
renderGroup: aDescription
	super renderGroup: aDescription.
	group isNil ifTrue: [ ^ self ].
	html tableRow class: 'group'; with: [ 
		html tableHeading
			colSpan: 2;
			with: group ]