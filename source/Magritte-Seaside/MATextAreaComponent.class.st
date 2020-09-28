"
I display an html text area for the magritte MAMemoDescription.
"
Class {
	#name : #MATextAreaComponent,
	#superclass : #MAElementComponent,
	#category : 'Magritte-Seaside-Components'
}

{ #category : #testing }
MATextAreaComponent class >> isAbstract [
	^ false
]

{ #category : #testing }
MATextAreaComponent >> hasLabelId [
	^ self isReadonly not
]

{ #category : #rendering }
MATextAreaComponent >> renderEditorOn: html [
	html textArea
		id: self labelId;
		rows: self magritteDescription lineCount;
		on: #string of: self
]

{ #category : #rendering }
MATextAreaComponent >> renderViewerOn: html [
	(self string findTokens: Character cr)
		do: [ :each | html render: each ]
		separatedBy: [ html break ]
]
