*Magritte-Glamour
glmPresentation
	| valuable |
	valuable := self 
		propertyAt: #glmPresentation
		ifAbsent: [ self glmDefaultPresentation ].
		
	valuable ifNil: [ ^ [ ] ].
	
	^ [ :composite :context :subject |
			| presentation |
			presentation := valuable cull: composite cull: context.
			self glmCustomizePresentation: presentation for: subject ]