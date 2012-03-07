private
buildContainer: anObject
	| containerPragmas containerPragma containerSelector extensionSelectors container |
	
	containerPragmas := Pragma 
		allNamed: self class containerPragma 
		from: anObject class to: Object.
		
	containerPragma := containerPragmas detect: [ :each | each method numArgs = 0 ].
	containerSelector := containerPragma method selector.

	extensionSelectors := (containerPragmas 
		select: [ :each | each method numArgs = 1 ]) 
		collect: [ :each | each method selector ]. 

	MADynamicDescribedObject use: anObject during: [	
		container := anObject perform: containerSelector.
		extensionSelectors do: [ :each | 
			anObject perform: each with: container ] ].

	^ container