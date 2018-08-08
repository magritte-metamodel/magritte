private
accessorInstance
	^ self actualClass
		read: [ :model | model value ]
		write: [ :model :object | model value: object ]