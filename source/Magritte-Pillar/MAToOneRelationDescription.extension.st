Extension { #name : 'MAToOneRelationDescription' }

{ #category : '*Magritte-Pillar' }
MAToOneRelationDescription >> pillarFor: anObject [
	| container |
	"Implementation note: A bit hackish maybe, but renderOn: needs a parent on which to render, so we make a document and then discard it"
	container := PRDocument new.
	MAPillarRenderer new
		object: (self read: anObject);
		renderOn: container.
	^ container children first
]
