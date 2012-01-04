private
buildMorph
	^ self description isReadonly
		ifTrue: [ self buildMorphView ]
		ifFalse: [ self buildMorphEditor ]