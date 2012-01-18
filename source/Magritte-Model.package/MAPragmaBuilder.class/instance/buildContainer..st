private
buildContainer: anObject
	| containerPragmas containerPragma containerSelector extensionSelectors container  |
	
	containerPragmas := Pragma 
		allNamed: self class containerPragma 
		from: anObject class to: Object.
		
	containerPragma := (containerPragmas detect: [ :each | each method numArgs = 0 ]).
	containerSelector := containerPragma method selector.
	container := anObject perform: containerSelector.
	
	extensionSelectors := containerPragmas 
		select: [ :each | each method numArgs = 1 ] 
		thenCollect: [ :each | each method selector ]. 

	extensionSelectors do: [ :each | 
		anObject perform: each with: container ].

	^ container