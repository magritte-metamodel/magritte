*Magritte-Model
uniqueActionSelectors

	| descriptionPragmas selectors |	
	descriptionPragmas := Pragma 
		allNamed: MAActionDescription maPragma
		from: self class to: Object.
		
	selectors := descriptionPragmas collect: [ :each | each method selector ].
	
	^ Set withAll: selectors