actions
validate
	"Flushes the cached state of some morphic elements (such as text-morphs) to the memento and then does the validation. I don't know of a better flush the morphic contents (happy flickering), probably morphic is just too limited to customize that easily or I am too dumb to find out."

	self morph allMorphsDo: [ :each |
		(each respondsTo: #accept)
			ifTrue: [ each accept ] ].
	self memento validate