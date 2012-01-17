private
buildMorph
	^ self magritteDescription isReadonly
		ifTrue: [ self buildMorphView ]
		ifFalse: [ self buildMorphEditor ]