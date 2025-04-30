Extension { #name : #MAIconDescription }

{ #category : #'*Magritte-GToolkit' }
MAIconDescription >> gtAddColumnTo: aView [

	self 
		propertyAt: #columnWidth
		ifPresent: [ :width |
			aView 
				column: self label 
					iconName: [ :anObject | anObject perform: self iconNameAccessor ]
					width: width.
			^ self ].
			
	aView 
		column: self label 
			iconName: [ :anObject | anObject perform: self iconNameAccessor ]
]
