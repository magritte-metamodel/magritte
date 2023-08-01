Extension { #name : #Symbol }

{ #category : #'*Magritte-NotGToolkit' }
Symbol >> cull: receiverObject cull: argumentObject [ 
	^ receiverObject perform: self withEnoughArguments: { argumentObject }
]
