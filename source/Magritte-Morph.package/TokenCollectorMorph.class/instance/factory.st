accessing
factory

	^ factory ifNil: [ factory := [ :text | text ] ]