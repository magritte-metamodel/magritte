Extension { #name : 'GLMMorphicRenderer' }

{ #category : '*Magritte-Glamour' }
GLMMorphicRenderer >> renderMagrittePresentation: aMagrittePresentation [ 
	^ GLMMorphicMagritteRenderer render: aMagrittePresentation from: self
]
