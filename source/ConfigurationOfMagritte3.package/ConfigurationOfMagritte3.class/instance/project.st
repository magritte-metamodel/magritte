accessing
project

	^ project ifNil: [ | projectAttributes |
		"Bootstrap Metacello if it is not already loaded"
		self class ensureMetacello.
		"Construct Metacello project"
		project := (Smalltalk at: #MetacelloMCProject) new.
		projectAttributes := #().
		Smalltalk at: #SystemVersion ifPresent: [:cl | | versionString |
			versionString := cl current version.
			((versionString beginsWith: 'Pharo-1.0') or: [versionString beginsWith: 'PharoCore1.0'])
				ifTrue: [ projectAttributes := projectAttributes, #(#'MagritteForPharo1.0') ] ].
		project projectAttributes:  projectAttributes.
		(Smalltalk at: #MetacelloVersionConstructor) on: self project: project.
		project loadType: #linear ]