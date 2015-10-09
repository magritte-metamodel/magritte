accessing
project

	^ project ifNil: [ | projectAttributes |
		"Bootstrap Metacello if it is not already loaded"
		self class ensureMetacello.
		"Construct Metacello project"
		project := (Smalltalk at: #MetacelloMCProject) new.
		projectAttributes := #().
		project projectAttributes:  projectAttributes.
		(Smalltalk at: #MetacelloVersionConstructor) on: self project: project.
		project loadType: #linear ]