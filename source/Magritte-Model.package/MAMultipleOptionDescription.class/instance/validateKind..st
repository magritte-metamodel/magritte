validating
validateKind: anObject
	super validateKind: anObject.
	anObject do: [ :e | self validateOptionKind: e ]