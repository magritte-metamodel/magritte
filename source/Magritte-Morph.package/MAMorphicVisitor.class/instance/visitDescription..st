visiting-description
visitDescription: anObject

	self magritteDescription isReadonly
		ifTrue: [ self builder buildMorphViewOn: self builder morph ]
		ifFalse: [ self builder buildMorphEditorOn: self builder morph ].