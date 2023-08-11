Extension { #name : #MAElementDescription }

{ #category : #'*Magritte-GToolkit' }
MAElementDescription >> gtAddColumnTo: aView [

	self 
		propertyAt: #columnWidth
		ifPresent: [ :width |
			aView 
				column: self label 
					text: [ :anObj | self readToString: anObj ]
					width: width.
			^ self ].
			
	self 
		propertyAt: #columnWeight
		ifPresent: [ :weight |
			aView 
				column: self label 
					text: [ :anObj | self readToString: anObj ]
					weight: weight.
			^ self ].
			
	aView 
		column: self label 
			text: [ :anObj | self readToString: anObj ]
]

{ #category : #'*Magritte-GToolkit' }
MAElementDescription >> gtCustomizeView: aView for: anObject [
	aView title = aView defaultTitle ifTrue: [ aView title: self label ].
	self flag: 'port #glmAddSelectionActions. Currently views don''t have context menus, so maybe add at top and disable if no selection (possible?)'.
]

{ #category : #'*Magritte-GToolkit' }
MAElementDescription >> gtView [
	| valuable |
	valuable := self 
		propertyAt: #gtView
		ifAbsent: [ self defaultGtView ].
	
	^ [ :aView :aDescription :anObject |
			| view |
			view := valuable cull: aView cull: aDescription cull: anObject.
			self gtCustomizeView: view for: anObject.
			view ]
]

{ #category : #'*Magritte-GToolkit' }
MAElementDescription >> gtView: aValuable [
	"aValuable:
		- FYI a default title, label, and selection actions will be added automatically by Magritte (see #glmCustomizeView:for:).
		- Arguments (all optional) 
				- the requesting view
				- this description
				- the object being viewed"
	self propertyAt: #gtView put: aValuable
]
