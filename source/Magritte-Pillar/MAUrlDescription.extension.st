Extension { #name : 'MAUrlDescription' }

{ #category : '*Magritte-Pillar' }
MAUrlDescription >> pillarFor: anObject [
	^ PRExternalLink new reference: (self toString: (self read: anObject))
]
