visiting-description
visitToOneRelationDescription: aDescription
	| sample |
	aDescription canExpand ifFalse: [ ^ super visitToOneRelationDescription: aDescription ].
	sample := self target isCollection
		ifTrue: [
			self target ifEmpty: [ ^ super visitToOneRelationDescription: aDescription ].
			self target anyOne ]
		ifFalse: [ self target ].
	(sample readUsing: aDescription)
		ifNil: [ super visitToOneRelationDescription: aDescription ]
		ifNotNil: [ :value | self expandDescription: aDescription for: value ]