Class {
	#name : #MARangeComponent,
	#superclass : #MAElementComponent,
	#category : 'Magritte-Seaside-Components'
}

{ #category : #testing }
MARangeComponent class >> isAbstract [
	^ false
]

{ #category : #testing }
MARangeComponent >> hasLabelId [
	^ self isReadonly not
]

{ #category : #accessing }
MARangeComponent >> labelId [
	^ self id
]

{ #category : #'accessing-dynamic' }
MARangeComponent >> max [
	^ self magritteDescription max ifNil: [ 100 ]
]

{ #category : #'accessing-dynamic' }
MARangeComponent >> min [
	^ self magritteDescription min ifNil: [ -100 ]
]

{ #category : #'accessing-dynamic' }
MARangeComponent >> range [
	^ self max - self min
]

{ #category : #rendering }
MARangeComponent >> renderEditorOn: html [
	html rangeInput
		id: self id;
		onInput: self updateScript;
		min: 0; "default"
		max: 100; "default"
		on: #string of: self.
	html span id: self id , 'v'.
	html script: self updateScript
]

{ #category : #private }
MARangeComponent >> updateScript [
	^ String streamContents: [ :stream |
		stream
			nextPutAll: 'document.getElementById('; print: self id , 'v';
			nextPutAll: ').innerHTML = document.getElementById('; print: self id;
			nextPutAll: ').value * ('; print: self range;
			nextPutAll: ') / 100 + ('; print: self min;
			nextPutAll: ');' ]
]

{ #category : #accessing }
MARangeComponent >> value [
	^ ((super value ifNil: [ 0 ]) - self min) * 100 / self range
]

{ #category : #accessing }
MARangeComponent >> value: aNumber [
	super value: (aNumber isNil ifFalse: [ aNumber * self range / 100 + self min ])
]
