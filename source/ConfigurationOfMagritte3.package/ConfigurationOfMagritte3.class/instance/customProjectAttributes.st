accessing
customProjectAttributes

	| projectAttributes versionString |
	projectAttributes := #().
	versionString := ''.
	Smalltalk at: #SystemVersion ifPresent: [:cl |versionString := cl current version].
	
	" Special Pharo1.0 "
	((versionString beginsWith: 'Pharo-1.0') or: [versionString beginsWith: 'PharoCore1.0'])
		ifTrue: [ projectAttributes := projectAttributes, #(#'MagritteForPharo1.0') ].

	" Traits if present "
	((versionString beginsWith: 'Pharo') or: [Smalltalk hasClassNamed: #Trait])
		ifTrue: [ projectAttributes := projectAttributes, #(#'MagritteWithTraits') ].

	" FileSystem if applicable "
	((versionString beginsWith: 'Pharo') or: [Smalltalk hasClassNamed: #FileSystem])
		ifTrue: [ projectAttributes := projectAttributes, #(#'MagritteWithFileSystem') ]
		ifFalse: [ projectAttributes := projectAttributes, #(#'MagritteWithFileDirectory') ].
		
	^ projectAttributes