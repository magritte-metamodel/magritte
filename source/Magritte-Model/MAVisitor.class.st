"
I am a visitor responsible for visiting Magritte descriptions. I am an abstract class providing a default implementation for concrete visitors.

My key entry point is #visit:, which starts the visiting process. Other visiting messages, like #visitAll:, send #visit: at some point.

In order to get from the generic #visit: to the #visitXyzDescription: message from my 'visiting-description' protocol that is appropriate for the object I'm visiting (e.g. #visitBooleanDescription:), a handshake is performed between me and that object using two double-dispatches. I send the object #acceptMagritte: with myself as argument. Each description type's acceptMagritte: method then sends the appropriate #visitXyzDescription: message back to me with itself as the argument.

My 'visiting-description' protocol reflects the hierarchy of *MADescription* and its subclasses. Visiting a class which my subclasses don't handle specifically automatically defaults to a less-specific implementation e.g. Boolean -> Element -> Description. This code, along with the corresponding #acceptMagritte: methods, was automatically created using code on my class-side.
"
Class {
	#name : #MAVisitor,
	#superclass : #MABasicObject,
	#category : #'Magritte-Model-Visitor'
}

{ #category : #private }
MAVisitor class >> buildVisitorHierarchyForClass: aClass selector: aBlock classified: aSelector [
	" self buildVisitorHierarchyForClass: MADescription selector: [ :class | 'visit' , (class name allButFirst: 2) , ':' ] classified: #'visiting-description' "

	| visitSourceCode acceptSourceCode classesOwnedByMagritte |
	classesOwnedByMagritte := aClass withAllSubclasses select: [ :class | class category beginsWith: 'Magritte' ].
	classesOwnedByMagritte do: [ :class | | visitSelector |
			visitSelector := aBlock value: class.
			visitSourceCode := String streamContents: [ :stream |
					stream nextPutAll: visitSelector; nextPutAll: ' aDescription'; cr.
					class = aClass ifFalse: [
						stream tab; nextPutAll: 'self '; nextPutAll: (aBlock value: class superclass); nextPutAll: ' anObject' ] ].
			self compile: visitSourceCode classified: aSelector.
				
			acceptSourceCode := String streamContents: [ :stream |
					stream nextPutAll: 'acceptMagritte: aVisitor'; cr.
					stream tab; nextPutAll: 'aVisitor '; nextPutAll: visitSelector; nextPutAll: ' self' ].
			class compile: acceptSourceCode classified: #visiting ]
]

{ #category : #visiting }
MAVisitor >> visit: anObject [
	"Visit ==anObject== with the receiving visitor."
	| errors |
	errors := OrderedCollection new.
	[
		anObject acceptMagritte: self.
	]
		on: MAValidationError
		do: [ :err | 
			errors add: err. 
			err resume ].
		
	errors isEmpty ifFalse: [
		MAMultipleErrors
			description: anObject 
			errors: errors
			signal: anObject label ]
]

{ #category : #visiting }
MAVisitor >> visitAll: aCollection [
	"Visit all elements of ==aCollection== with the receiving visitor."

	aCollection do: [ :each | self visit: each ]
]

{ #category : #'visiting-description' }
MAVisitor >> visitBlockDescription: anObject [
	self visitElementDescription: anObject
]

{ #category : #'visiting-description' }
MAVisitor >> visitBooleanDescription: anObject [
	self visitElementDescription: anObject
]

{ #category : #'visiting-description' }
MAVisitor >> visitClassDescription: anObject [
	self visitElementDescription: anObject
]

{ #category : #'visiting-description' }
MAVisitor >> visitColorDescription: anObject [
	self visitElementDescription: anObject
]

{ #category : #'visiting-description' }
MAVisitor >> visitContainer: anObject [
	self visitDescription: anObject
]

{ #category : #'visiting-description' }
MAVisitor >> visitDateAndTimeDescription: anObject [
	self visitMagnitudeDescription: anObject
]

{ #category : #'visiting-description' }
MAVisitor >> visitDateDescription: anObject [
	self visitMagnitudeDescription: anObject
]

{ #category : #'visiting-description' }
MAVisitor >> visitDescription: anObject [

]

{ #category : #'visiting-description' }
MAVisitor >> visitDirectoryDescription: anObject [
	self visitFileDescription: anObject
]

{ #category : #'visiting-description' }
MAVisitor >> visitDurationDescription: anObject [
	self visitMagnitudeDescription: anObject
]

{ #category : #'visiting-description' }
MAVisitor >> visitElementDescription: anObject [
	self visitDescription: anObject
]

{ #category : #'visiting-description' }
MAVisitor >> visitFileDescription: anObject [
	self visitElementDescription: anObject
]

{ #category : #'visiting-description' }
MAVisitor >> visitMagnitudeDescription: anObject [
	self visitElementDescription: anObject
]

{ #category : #'visiting-description' }
MAVisitor >> visitMemoDescription: anObject [
	self visitStringDescription: anObject
]

{ #category : #'visiting-description' }
MAVisitor >> visitMultipleOptionDescription: anObject [
	self visitOptionDescription: anObject
]

{ #category : #'visiting-description' }
MAVisitor >> visitNumberDescription: anObject [
	self visitMagnitudeDescription: anObject
]

{ #category : #'visiting-description' }
MAVisitor >> visitOptionDescription: anObject [
	self visitReferenceDescription: anObject
]

{ #category : #'visiting-description' }
MAVisitor >> visitPasswordDescription: anObject [
	self visitStringDescription: anObject
]

{ #category : #'visiting-description' }
MAVisitor >> visitPriorityContainer: anObject [
	self visitContainer: anObject
]

{ #category : #'visiting-description' }
MAVisitor >> visitReferenceDescription: anObject [
	self visitElementDescription: anObject
]

{ #category : #'visiting-description' }
MAVisitor >> visitRelationDescription: anObject [
	self visitReferenceDescription: anObject
]

{ #category : #'visiting-description' }
MAVisitor >> visitReportContainer: anObject [
	self visitContainer: anObject
]

{ #category : #'visiting-description' }
MAVisitor >> visitSingleOptionDescription: anObject [
	self visitOptionDescription: anObject
]

{ #category : #'visiting-description' }
MAVisitor >> visitStringDescription: anObject [
	self visitElementDescription: anObject
]

{ #category : #'visiting-description' }
MAVisitor >> visitSymbolDescription: anObject [
	self visitStringDescription: anObject
]

{ #category : #'visiting-description' }
MAVisitor >> visitTableDescription: anObject [
	self visitReferenceDescription: anObject
]

{ #category : #'visiting-description' }
MAVisitor >> visitTableReference: anObject [
	^ self visitReferenceDescription: anObject
]

{ #category : #'visiting-description' }
MAVisitor >> visitTimeDescription: anObject [
	self visitMagnitudeDescription: anObject
]

{ #category : #'visiting-description' }
MAVisitor >> visitTimeStampDescription: anObject [
	self visitMagnitudeDescription: anObject
]

{ #category : #'visiting-description' }
MAVisitor >> visitToManyRelationDescription: anObject [
	self visitRelationDescription: anObject
]

{ #category : #'visiting-description' }
MAVisitor >> visitToManyScalarRelationDescription: anObject [
	self visitToManyRelationDescription: anObject
]

{ #category : #'visiting-description' }
MAVisitor >> visitToOneRelationDescription: anObject [
	self visitRelationDescription: anObject
]

{ #category : #'visiting-description' }
MAVisitor >> visitTokenDescription: anObject [
	self visitReferenceDescription: anObject
]

{ #category : #'visiting-descriptions' }
MAVisitor >> visitUrlDescription: aMAUrlDescription [ 
	self visitElementDescription: aMAUrlDescription
]
