comparing
= anObject
	"Answer whether the receiver and the argument represent the same object. This default implementation checks if the species of the compared objects are the same, so that superclasses might call super before performing their own check. Also redefine the message ==#hash== when redefining this message."

	^ self species = anObject species