private
object: anObject during: aBlock
	| previous |
	previous := self object. self object: anObject.
	aBlock ensure: [ self object: previous ]