Class {
	#name : #MAFileModelHandler,
	#superclass : #WARequestHandler,
	#instVars : [
		'model'
	],
	#category : 'Magritte-Seaside-Core'
}

{ #category : #'error handling' }
MAFileModelHandler class >> defaultErrorClass [
	^ MAError
]

{ #category : #'instance creation' }
MAFileModelHandler class >> on: aFileModel [
	^ self new initializeOn: aFileModel
]

{ #category : #comparing }
MAFileModelHandler >> = aHandler [
	^ self species = aHandler species and: [ self model = aHandler model ]
]

{ #category : #processing }
MAFileModelHandler >> handleFiltered: aRequestContext [
	| response mimeType |
	response := aRequestContext response.
	mimeType := self model mimetype seasideMimeType.
	response
		binary;
		cacheForever;
		contentType: mimeType;
		headerAt: 'Content-Disposition' put: 'inline; filename="' , self model filename , '"'.
	response
		nextPutAll: self model contents;
		respond
]

{ #category : #comparing }
MAFileModelHandler >> hash [
	^ self model hash
]

{ #category : #initialization }
MAFileModelHandler >> initializeOn: aFileModel [
	model := aFileModel
]

{ #category : #accessing }
MAFileModelHandler >> model [
	^ model
]
