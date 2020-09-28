Extension { #name : #MAElementDescription }

{ #category : #'*magritte-seaside-accessing' }
MAElementDescription >> checkboxLabel [
	^ self propertyAt: #checkboxLabel ifAbsent: [ self label ]
]

{ #category : #'*magritte-seaside-accessing' }
MAElementDescription >> checkboxLabel: aString [
	self propertyAt: #checkboxLabel put: aString
]
