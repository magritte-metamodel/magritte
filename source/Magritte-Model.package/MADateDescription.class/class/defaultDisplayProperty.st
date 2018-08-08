accessing-defaults
defaultDisplayProperty
	^ [ :aDateOrNil | 
				aDateOrNil
					ifNotNil: [ aDateOrNil greaseString ]
					ifNil: [ '' ] ]