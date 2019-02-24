callbacks
remove
	container remove: object.
	self owner addMorph: container buildSelectList.
	self delete.