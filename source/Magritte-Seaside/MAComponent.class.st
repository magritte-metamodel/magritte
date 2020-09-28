Class {
	#name : #MAComponent,
	#superclass : #WAComponent,
	#category : 'Magritte-Seaside-Core'
}

{ #category : #'error handling' }
MAComponent class >> defaultErrorClass [
	^ MAError
]

{ #category : #testing }
MAComponent class >> isAbstract [
	^ true
]

{ #category : #'instance creation' }
MAComponent class >> new [
	"Create a new instance of the receiving component class and checks if it is not abstract."

	self isAbstract
		ifTrue: [ self error: self name , ' is abstract.' ].
	^ super new
]

{ #category : #reflection }
MAComponent class >> withAllConcreteClasses [
	^ Array streamContents: [ :stream |
		self withAllConcreteClassesDo: [ :each |
			stream nextPut: each ] ]
]

{ #category : #reflection }
MAComponent class >> withAllConcreteClassesDo: aBlock [
	self withAllSubclassesDo: [ :each |
		each isAbstract ifFalse: [
			aBlock value: each ] ]
]

{ #category : #accessing }
MAComponent >> ajaxId [
	^ self ajaxId: String new
]

{ #category : #accessing }
MAComponent >> ajaxId: aSymbol [
	^ String streamContents: [ :stream |
		stream
			nextPutAll: 'ajax';
			nextPutAll: self class name;
			print: self hash;
			nextPutAll: aSymbol ]
]
