instance creation
new
	"Create a new instance of the receiving class and checks if it is concrete."

	self isAbstract
		ifTrue: [ self error: self name , ' is abstract.' ].
	^ super new