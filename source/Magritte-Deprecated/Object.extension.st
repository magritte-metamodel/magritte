Extension { #name : #Object }

{ #category : #'*magritte-deprecated' }
Object class >> description [
	self greaseDeprecatedApi: 'Object class>>#description' details: '#description has been renamed to #magritteDescription as #description is a heavily overloaded term.'. 
	
	^ self magritteDescription
]

{ #category : #'*magritte-deprecated' }
Object >> description [
	self greaseDeprecatedApi: 'Object>>#description' details: '#description has been renamed to #magritteDescription as #description is a heavily overloaded term.'. 

	^ self magritteDescription
]
