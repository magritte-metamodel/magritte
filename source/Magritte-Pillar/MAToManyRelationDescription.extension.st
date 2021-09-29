Extension { #name : 'MAToManyRelationDescription' }

{ #category : '*Magritte-Pillar' }
MAToManyRelationDescription >> pillarFor: anObject [
	| doc elements |
	doc := PRTable new.
	elements := self read: anObject.
	elements do: [ :e | 
		| cell row |
		cell := PRTableCell new.
		row := PRTableRow new
			add: cell;
			yourself.
		MAPillarRenderer new
			object: e;
			renderOn: cell.
		doc add: row ].
	^ doc.
	
	"Implementation note: tried implementing as `MAPillarRenderer >> #visitToManyRelationDescription:`, but then it wasn't straightforward to reuse other common logic e.g. all elements need a label and then a control rendered"
]
