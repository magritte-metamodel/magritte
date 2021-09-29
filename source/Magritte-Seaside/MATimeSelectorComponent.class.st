Class {
	#name : #MATimeSelectorComponent,
	#superclass : #MATimeInputComponent,
	#category : 'Magritte-Seaside-Components'
}

{ #category : #testing }
MATimeSelectorComponent class >> isAbstract [
	^false
]

{ #category : #rendering }
MATimeSelectorComponent >> renderInputOn: html [
	html timeInput
		withSeconds;
		value: self value;
		callback: [ :value | self value: value ]
]
