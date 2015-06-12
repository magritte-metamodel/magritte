testing
hasLabel
	"Answer ==true== if the the receiver has got a non empty label."

	^ self label notNil and: [ self label isEmpty not ]