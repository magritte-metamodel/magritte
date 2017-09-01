*Magritte-Merging
patchRelativeToBase: baseName 

	| operations |
	operations := self magritteDescription children asOrderedCollection flatCollect: [ :desc | desc patch: self relativeTo: baseName ].
	^ operations select: #isNotNil