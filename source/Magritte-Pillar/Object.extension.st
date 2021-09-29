Extension { #name : 'Object' }

{ #category : '*Magritte-Pillar' }
Object >> maPillar [
	| doc |
	doc := PRDocument new.
	self maPillarRenderer renderOn: doc.
	^ doc
]

{ #category : '*Magritte-Pillar' }
Object >> maPillarRenderer [
	^ MAPillarRenderer new
			object: self;
			yourself
]
