Extension { #name : #MorphicUIManager }

{ #category : #'*Magritte-Pharo7-Model' }
MorphicUIManager >> chooseFile: windowTitle in: directoryString [
	| chooser |
	chooser := FileDialogWindow newWithTheme: Smalltalk ui theme.
	chooser
		title: windowTitle;
		selectDirectory: directoryString;
		answerFileEntry.
	^ chooser openModal answer
		ifNotNil: [ :answer | answer asFileReference ]
]
