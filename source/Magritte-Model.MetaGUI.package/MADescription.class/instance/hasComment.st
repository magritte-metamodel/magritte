testing
hasComment
	"Answer ==true== if the the receiver has got a non empty comment."

	^ self comment notNil and: [ self comment isEmpty not ]