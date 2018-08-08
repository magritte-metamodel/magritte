accessing
rows: aCollection
	"Set the rows of the receiver."
	
	rows := aCollection ifNil: [ Array new ].
	self refresh