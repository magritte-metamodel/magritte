Extension { #name : 'MAElementDescription' }

{ #category : '*Magritte-Glamour' }
MAElementDescription >> glmCustomizePresentation: presentation for: domainObject [
	presentation hasTitle ifFalse: [ presentation title: self label ].
	presentation hasTransformation ifFalse: [ presentation display: (self accessor read: domainObject) ].
	presentation glmAddSelectionActions
]

{ #category : '*Magritte-Glamour' }
MAElementDescription >> glmPresentation [
	| valuable |
	valuable := self 
		propertyAt: #glmPresentation
		ifAbsent: [ self glmDefaultPresentation ].
		
	valuable ifNil: [ ^ [ ] ].
	
	^ [ :composite :context :subject |
			| presentation |
			presentation := valuable cull: composite cull: context.
			self glmCustomizePresentation: presentation for: subject ]
]

{ #category : '*Magritte-Glamour' }
MAElementDescription >> glmPresentation: aValuable [
	"aValuable:
		- Return value: a Glamour presentaion; FYI a default title, label, and selection actions will be added automatically by Magritte (see #glmCustomizePresentation:for:).
		- Arguments (all optional) 
				- composite - the container presentation
				- context - e.g. an Inspector
				- subject - the object being visualized
		- To disable the presentation, make aValuable = `nil`"
	self propertyAt: #glmPresentation put: aValuable
]
