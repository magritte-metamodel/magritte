accessing
objectDescription: aDescription
	"Motivation: By way of example, let's say you have a music library with different types of items, but you only want to render songs, you might say:
		```smalltalk
			aRenderer objectDescription: (anObject magritteDescription select: [ :e | e label = 'Songs' ])```"
	objectDescription := aDescription