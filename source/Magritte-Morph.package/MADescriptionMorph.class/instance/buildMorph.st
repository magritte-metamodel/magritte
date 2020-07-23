private
buildMorph

	| result |
	result := self rectangleMorph
		setBalloonText: self magritteDescription comment;
		yourself.
	self magritteDescription isReadOnly
		ifTrue: [ self buildMorphViewOn: result ]
		ifFalse: [ self buildMorphEditorOn: result ].
	^ result