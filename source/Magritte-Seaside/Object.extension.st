Extension { #name : #Object }

{ #category : #'*magritte-seaside-converting' }
Object >> asComponent [
	^ self magritteDescription asComponentOn: self
]
