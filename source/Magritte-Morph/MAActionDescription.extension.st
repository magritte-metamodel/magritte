Extension { #name : #MAActionDescription }

{ #category : #'*magritte-morph' }
MAActionDescription >> buttonOn: anObject [
	| buttonLabel |
	"Copied alpha morph wrapping from TEasilyThemed. Not sure how/why it works..."
	buttonLabel := self icon ifNil: [ self label ] ifNotNil: [ :i | AlphaImageMorph new image: i ].
	^ Smalltalk ui theme builder
		newButtonFor: self
		getState: nil
		action: #performOn:
		arguments: {anObject}
		getEnabled: #isEnabled
		label: buttonLabel
		help: comment
]
