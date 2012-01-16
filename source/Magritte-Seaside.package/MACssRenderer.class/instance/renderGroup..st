rendering
renderGroup: aDescription
	super renderGroup: aDescription.
	group isNil ifTrue: [ ^ self ].
	html definitionTerm
		class: 'group';
		with: group