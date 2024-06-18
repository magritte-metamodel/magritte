Extension { #name : 'Object' }

{ #category : '*Magritte-Morph' }
Object >> asMagritteMorph [
	^ self magritteDescription asMorphOn: self
]

{ #category : '*Magritte-Morph' }
Object >> maEdit [
 
	self maEditAnswering: [ :editedObj | ]
]

{ #category : '*Magritte-Morph' }
Object >> maEditAnswering: aBlock [
 
	self asMagritteMorph
		addButtons;
		addWindow;
		onAnswer: aBlock;
		openInWorld.
]

{ #category : '*Magritte-Morph' }
Object >> magritteActionButtons [
	^ self magritteActions collect: [ :e | e buttonOn: self ].
]
