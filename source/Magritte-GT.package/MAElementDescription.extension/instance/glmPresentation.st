*Magritte-GT
glmPresentation
	| valuable |
	valuable := self 
		propertyAt: #glmPresentation
		ifAbsent: [ self glmDefaultPresentation ].
	
	^ [ :composite :context :subject |
			| presentation |
			presentation := valuable cull: composite cull: context.
			self glmCustomizePresentation: presentation for: subject ]