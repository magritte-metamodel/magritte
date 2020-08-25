"
I'm the MAFileDescription seaside component. With me user can upload files to the server. I provide a button for the user to browse their computer for files.
"
Class {
	#name : #MAFileUploadComponent,
	#superclass : #MAElementComponent,
	#category : 'Magritte-Seaside-Components'
}

{ #category : #testing }
MAFileUploadComponent class >> isAbstract [
	^ false
]

{ #category : #testing }
MAFileUploadComponent >> hasLabelId [
	^ self requiresMultipartForm
]

{ #category : #actions }
MAFileUploadComponent >> remove [
	self value isNil
		ifFalse: [ self value finalize ].
	self value: nil
]

{ #category : #rendering }
MAFileUploadComponent >> renderEditorOn: html [
	self requiresMultipartForm
		ifTrue: [ self renderUploadOn: html ]
		ifFalse: [ self renderRemoveOn: html ]
]

{ #category : #rendering }
MAFileUploadComponent >> renderRemoveOn: html [
	html render: self value.
	html text: ' ('; render: self value filesize asFileSize; text: ') '.
	html submitButton on: #remove of: self
]

{ #category : #rendering }
MAFileUploadComponent >> renderUploadOn: html [
	html fileUpload
		id: self labelId;
		on: #upload of: self.
	html submitButton
		text: 'upload'
]

{ #category : #rendering }
MAFileUploadComponent >> renderViewerOn: html [
	html render: self value
]

{ #category : #testing }
MAFileUploadComponent >> requiresMultipartForm [
	^ self isReadonly not and: [ self value isNil or: [ self value isEmpty ] ]
]

{ #category : #actions }
MAFileUploadComponent >> upload: aFile [ 
	self value: (aFile isNil ifFalse: [ 
		self magritteDescription  kind new
			filename: aFile fileName;
			mimetype: aFile contentType greaseString;
			contents: aFile rawContents;
			yourself ])
]
