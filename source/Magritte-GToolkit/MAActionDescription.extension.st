Extension { #name : #MAActionDescription }

{ #category : #'*Magritte-GToolkit' }
MAActionDescription >> gtAction: aValuable [
	"aValuable - optional arguments are the button and this description"

	^ self propertyAt: #gtAction put: aValuable
]

{ #category : #'*Magritte-GToolkit' }
MAActionDescription >> gtActionFor: anObject [
	| result tooltip |
	result := GtPhlowNoAction new button.
	
	result action: [ :button |
		self
			propertyAt: #gtAction
			ifPresent: [ :valuable | 
				valuable cull: button cull: self ]
			ifAbsent: [ self performOn: anObject ] ].
	self
		propertyAt: #gtIcon
		ifPresent: [ :i | 
			result icon: i value.
			tooltip := self label, ': ', self comment ]
		ifAbsent: [ 
			result label: self label.
			tooltip := self comment ].
	
	tooltip ifNotEmpty: [ result tooltip: tooltip ].
	
	^ result
]

{ #category : #'*Magritte-GToolkit' }
MAActionDescription >> gtIcon [
	^ self propertyAt: #gtIcon ifPresent: [ :i | i value ].
	"Implementation note: see setter"
]

{ #category : #'*Magritte-GToolkit' }
MAActionDescription >> gtIcon: formValuable [
	self propertyAt: #gtIcon put: formValuable.
	"Implementation note: Store as a valuable so that potentially expensive form creation can be deferred until use. Use property instead of inst var because:
		- we can scope this to GToolkit as an extension method
		- It seems to fit with the 'instVar=mandatory, prop=optional' guideline"
]
