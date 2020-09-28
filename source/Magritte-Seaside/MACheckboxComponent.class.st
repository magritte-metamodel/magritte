"
I'm a seaside component used to display MABooleanDescription. If I'm writeable (readonly property of my description to false) I display a checkbox otherwise, I display a string: 'yes' if true, 'no' if false', '' if nil.
"
Class {
	#name : #MACheckboxComponent,
	#superclass : #MAElementComponent,
	#category : 'Magritte-Seaside-Components'
}

{ #category : #testing }
MACheckboxComponent class >> isAbstract [
	^ false
]

{ #category : #testing }
MACheckboxComponent >> hasLabelId [
	^ true
]

{ #category : #rendering }
MACheckboxComponent >> renderEditorOn: html [
	html label: [
		html checkbox
			id: self labelId;
			disabled: self isReadonly;
			on: #value of: self.
		html space; render: self magritteDescription checkboxLabel ]
]
