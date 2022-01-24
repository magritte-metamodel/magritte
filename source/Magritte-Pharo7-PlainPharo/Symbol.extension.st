Extension { #name : #Symbol }

{ #category : #'*Magritte-Pharo7-PlainPharo' }
Symbol >> cull: receiverObject cull: argumentObject [ 
	^ receiverObject perform: self withEnoughArguments: { argumentObject }
]
