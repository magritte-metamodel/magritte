Class {
	#name : #MABlockDescription,
	#superclass : #MAElementDescription,
	#category : #'Magritte-Model-Description'
}

{ #category : #'accessing-defaults' }
MABlockDescription class >> defaultKind [
	^ BlockClosure
]

{ #category : #'accessing-defaults' }
MABlockDescription class >> defaultLineCount [
	^ 3
]

{ #category : #'as yet unclassified' }
MABlockDescription class >> defaultMorphClasses [
	^ Array with: MAMorphicMemo
]

{ #category : #testing }
MABlockDescription class >> isAbstract [
	^ false
]

{ #category : #accessing }
MABlockDescription class >> label [
	^ 'Block'
]

{ #category : #visiting }
MABlockDescription >> acceptMagritte: aVisitor [
	aVisitor visitBlockDescription: self
]

{ #category : #'accessing-magritte' }
MABlockDescription >> descriptionLineCount [
	<magritteDescription>
	^ MANumberDescription new
		accessor: #lineCount;
		label: 'Number of Lines';
		priority: 400;
		default: self class defaultLineCount;
		beInteger;
		min: 1;
		yourself
]

{ #category : #accessing }
MABlockDescription >> lineCount [
	^ self propertyAt: #lineCount ifAbsent: [ self class defaultLineCount ]
]

{ #category : #accessing }
MABlockDescription >> lineCount: anInteger [
	self propertyAt: #lineCount put: anInteger
]
