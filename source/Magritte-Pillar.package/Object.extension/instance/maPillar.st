*Magritte-Pillar
maPillar
	| doc |
	doc := PRDocument new.
	self maPillarRenderer renderOn: doc.
	^ doc