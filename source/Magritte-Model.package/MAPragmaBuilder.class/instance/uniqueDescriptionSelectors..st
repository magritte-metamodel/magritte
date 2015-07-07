private
uniqueDescriptionSelectors: anObject
	| descriptionPragmas selectors |
	
	descriptionPragmas := Pragma 
		allNamed: self magritteDescriptionPragma 
		from: anObject class to: Object.
		
	selectors := descriptionPragmas collect: [ :each | each method selector ].
	
	^ Set withAll: selectors