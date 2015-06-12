model
read: aModel
	^ aModel at: self key ifAbsent: [ nil ]