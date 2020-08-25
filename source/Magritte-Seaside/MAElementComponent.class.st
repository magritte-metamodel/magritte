"
I provide a basic display for all subclasses of MAElementDescription (only for readonly descriptions). The object is just displayed as a string. For more complex behaviour, overried #renderViewerOn:. 
"
Class {
	#name : #MAElementComponent,
	#superclass : #MADescriptionComponent,
	#category : 'Magritte-Seaside-Components'
}

{ #category : #calling }
MAElementComponent >> chooser: aComponent [
	self chooser: aComponent titled: 'Edit ' , self magritteDescription label
]

{ #category : #calling }
MAElementComponent >> chooser: aComponent titled: aString [
	self root
		show: (aComponent
			addMessage: aString;
			yourself)
		onAnswer: [ :result |
			result isNil
				ifFalse: [ self value: result ] ]
]

{ #category : #testing }
MAElementComponent >> hasLabelId [
	"Return whether somewhere an element is rendered with the id ==labelId== that can be reference by a <label>-tag."

	^ false
]

{ #category : #accessing }
MAElementComponent >> reference [
	^ self magritteDescription reference
]

{ #category : #rendering }
MAElementComponent >> renderContentOn: html [
	self isReadonly
		ifTrue: [ self renderViewerOn: html ]
		ifFalse: [ self renderEditorOn: html ]
]

{ #category : #rendering }
MAElementComponent >> renderEditorOn: html [
	self renderViewerOn: html
]

{ #category : #rendering }
MAElementComponent >> renderViewerOn: html [
	html render: self string
]

{ #category : #'accessing-model' }
MAElementComponent >> string [
	^ self value isString
		ifTrue: [ self value ]
		ifFalse: [ self magritteDescription toString: self value ]
]

{ #category : #'accessing-model' }
MAElementComponent >> string: aString [
	| value |
	value := [ self magritteDescription fromString: aString ]
		on: Error do: [ :e | e return: aString ].
	self value: value
]

{ #category : #'accessing-model' }
MAElementComponent >> value [
	^ self memento readUsing: self magritteDescription
]

{ #category : #'accessing-model' }
MAElementComponent >> value: anObject [
	self memento write: anObject using: self magritteDescription
]
