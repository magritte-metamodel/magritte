comparing
= anObject
	^ self species = anObject species
		and: [ self filename = anObject filename
		and: [ self mimetype = anObject mimetype ] ]