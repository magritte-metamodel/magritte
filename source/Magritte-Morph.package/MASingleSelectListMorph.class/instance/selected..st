accessing
selected: anInteger
	self value: (self options at: anInteger ifAbsent: [ nil ]).
	self changed: #selected