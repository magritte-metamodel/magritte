accessing
gtActionFor: anObject
	| result tooltip |
	result := GtPhlowNoAction new button
		action: [ self performOn: anObject ];
		yourself.
	self
		propertyAt: #gtIcon
		ifPresent: [ :i | 
			result icon: i value.
			tooltip := self label, ': ', self comment ]
		ifAbsent: [ 
			result label: self label.
			tooltip := self comment ].
		tooltip ifNotEmpty: [ result tooltip: tooltip ].
	^ result