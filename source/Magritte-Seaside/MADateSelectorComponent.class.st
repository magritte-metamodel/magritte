Class {
	#name : #MADateSelectorComponent,
	#superclass : #MADateInputComponent,
	#category : 'Magritte-Seaside-Components'
}

{ #category : #testing }
MADateSelectorComponent class >> isAbstract [
	^false
]

{ #category : #rendering }
MADateSelectorComponent >> renderButtonOn: html [
]

{ #category : #rendering }
MADateSelectorComponent >> renderInputOn: html [
	html dateInput
		value: self value;
		callback: [ :value | self value: value ]
]
