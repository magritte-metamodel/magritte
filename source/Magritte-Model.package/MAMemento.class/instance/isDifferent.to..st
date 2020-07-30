private
isDifferent: firstDictionary to: secondDictionary
	| firstValue secondValue |
	self magritteDescription do: [ :each |
		(each isVisible and: [ each isReadOnly not ]) ifTrue: [
			firstValue := firstDictionary at: each ifAbsent: [ nil ].
			secondValue := secondDictionary at: each ifAbsent: [ nil ].
			firstValue = secondValue ifFalse: [ ^ true ] ] ].
	^ false