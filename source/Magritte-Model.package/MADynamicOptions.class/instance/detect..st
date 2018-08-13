as yet unclassified
detect: anObject
	"Convert from a possibly-optimized object for entry-completion, to the object that should be saved"
	^ self reader value: anObject