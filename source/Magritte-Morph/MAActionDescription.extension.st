Extension { #name : #MAActionDescription }

{ #category : #'*magritte-morph' }
MAActionDescription >> buttonOn: anObject [
	^ Smalltalk ui theme builder
		newButtonFor: self
		getState: nil
		action: #performOn:
		arguments: {anObject}
		getEnabled: #isEnabled
		label: self label
		help: comment
]
