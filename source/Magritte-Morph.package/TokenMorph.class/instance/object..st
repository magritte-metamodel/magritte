accessing
object: anObject
	object := anObject.
	self removeAllMorphs.
	self addMorph: object asString asMorph