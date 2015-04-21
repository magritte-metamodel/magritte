private
buildMorph

	| result |
	result := self rectangleMorph
		setBalloonText: self magritteDescription comment;
		yourself.
	self magritteDescription isReadonly
		ifTrue: [ self buildMorphViewOn: result ]
		ifFalse: [ self buildMorphEditorOn: result ].
	^ result