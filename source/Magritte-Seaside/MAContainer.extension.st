Extension { #name : #MAContainer }

{ #category : #'*magritte-seaside-converting' }
MAContainer >> asComponentOn: anObject [
	^ self componentClass
		memento: (anObject mementoClass
			model: anObject
			description: self)
]

{ #category : #'*magritte-seaside-accessing' }
MAContainer >> componentRenderer [
	^ self propertyAt: #componentRenderer ifAbsent: [ self class defaultComponentRenderer ]
]

{ #category : #'*magritte-seaside-accessing' }
MAContainer >> componentRenderer: aClass [
	self propertyAt: #componentRenderer put: aClass
]

{ #category : #'*magritte-seaside-defaults' }
MAContainer class >> defaultComponentClasses [
	^ Array with: MAContainerComponent
]

{ #category : #'*magritte-seaside-defaults' }
MAContainer class >> defaultComponentRenderer [
	^ MATableRenderer
]
