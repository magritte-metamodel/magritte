*magritte-model-actions
uniqueDescriptionSelectors

	| descriptionPragmas selectors |	
	descriptionPragmas := Pragma 
		allNamed: #magritteAction
		from: self class to: Object.
		
	selectors := descriptionPragmas collect: [ :each | each method selector ].
	
	^ Set withAll: selectors