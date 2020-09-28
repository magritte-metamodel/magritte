Class {
	#name : #MAActionColumn,
	#superclass : #MAColumn,
	#category : 'Magritte-Seaside-Report'
}

{ #category : #'accessing-defaults' }
MAActionColumn >> defaultLabel [
	^ String new
]

{ #category : #'accessing-defaults' }
MAActionColumn >> defaultUseLinks [
	^ true
]

{ #category : #rendering }
MAActionColumn >> renderCellContent: anObject on: html [
	self useLinks
		ifTrue: [ self renderCellLinkContent: anObject on: html ]
		ifFalse: [ self renderCellFormContent: anObject on: html ]
]

{ #category : #rendering }
MAActionColumn >> renderCellFormContent: anObject on: html [
	self subclassResponsibility
]

{ #category : #rendering }
MAActionColumn >> renderCellLinkContent: anObject  on: html [
	self subclassResponsibility
]

{ #category : #accessing }
MAActionColumn >> useLinks [
	^ self propertyAt: #useLinks ifAbsent: [ self defaultUseLinks ]
]

{ #category : #accessing }
MAActionColumn >> useLinks: aBoolean [
	self propertyAt: #useLinks put: aBoolean
]
