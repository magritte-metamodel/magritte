Extension { #name : 'MAElementDescription' }

{ #category : '*Magritte-Pillar' }
MAElementDescription >> pillarFor: anObject [
	^ PRText content: (self toString: (self read: anObject))
]
