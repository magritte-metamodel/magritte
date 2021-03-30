"
I am a description of files, their contents, filename and mime-type. Possible values include instances of *MAFileModel*. My visual representation could be a file-upload dialog.
"
Class {
	#name : #MAFileDescription,
	#superclass : #MAElementDescription,
	#category : #'Magritte-Model-Description'
}

{ #category : #'accessing-defaults' }
MAFileDescription class >> defaultDisplayProperty [
	^ #filename
]

{ #category : #'accessing-defaults' }
MAFileDescription class >> defaultKind [
	^ MAMemoryFileModel
]

{ #category : #testing }
MAFileDescription class >> isAbstract [
	^ false
]

{ #category : #accessing }
MAFileDescription class >> label [
	^ 'File'
]

{ #category : #visiting }
MAFileDescription >> acceptMagritte: aVisitor [
	aVisitor visitFileDescription: self
]
