instance creation
new
	"override #new so that we can create an object without adding it to the collection returned by: MAElementDescription withAllConcreteClasses,
	that is so we can call  MAElementDescription new magritteDescription  and it works as expected, which is used in MADescriptionEditor>>#buildReport .
	Yes it's a hack, but it works... (better ideas gratefully received)"
	^ self basicNew initialize