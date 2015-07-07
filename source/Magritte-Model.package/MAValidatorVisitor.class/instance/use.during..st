private
use: anObject during: aBlock
	| previous |
	previous := object. object := anObject.
	^ aBlock ensure: [ object := previous ]