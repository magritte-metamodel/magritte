*Magritte-Pharo-Model
chooseFile: windowTitle in: directoryString

	| chooser |
	chooser := FileDialogWindow newWithTheme: UITheme current.
	chooser
		title: windowTitle;
		selectDirectory: directoryString;
		answerFileEntry.
	^ chooser openModal answer ifNotNil: [ :answer | answer asFileReference ].