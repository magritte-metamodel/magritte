*magritte-model-accessing
description
	"Return the canonical description of the receiver. Subclasses might override this message to return instance-based descriptions."
	self 
		deprecated: '#description is too ambiguous' 
		on: '11 December 2011'  
		in: 'Pharo1.4'.
	^ self magritteDescription