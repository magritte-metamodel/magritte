instance creation
new
	"Create a new instance of the receiving component class and checks if it is not abstract."

	self isAbstract
		ifTrue: [ self error: self name , ' is abstract.' ].
	^ super new