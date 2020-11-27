Class {
	#name : #MAUndefinedComponent,
	#superclass : #MAElementComponent,
	#category : 'Magritte-Seaside-Components'
}

{ #category : #testing }
MAUndefinedComponent class >> isAbstract [
	^ false
]

{ #category : #testing }
MAUndefinedComponent >> hasLabelId [
	^ true
]

{ #category : #rendering }
MAUndefinedComponent >> renderContentOn: html [
	html span
		id: self labelId;
		style: 'color: red;';
		with: 'Undefined Component'
]
