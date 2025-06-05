"
I handle one line of text.
"
Class {
	#name : 'TextInputFieldModel',
	#superclass : 'TextModel',
	#instVars : [
		'ghostText',
		'alwaysAccept',
		'acceptOnCR',
		'autoAccept',
		'entryCompletion',
		'isEncrypted'
	],
	#category : 'Spec-Widgets'
}

{ #category : 'specs' }
TextInputFieldModel class >> defaultSpec [
	<spec>
	^ {#TextField.
			#convertTo:. 							String.
			#on:text:accept:readSelection:menu:. 	#model. #getText. #accept:. nil. nil.
			#entryCompletion:. 				{	#model. 	#entryCompletion	}.
			#autoAccept:.						{	#model. 	#autoAccept			}.	
			#ghostText:.						{	#model. 	#ghostText			}.
			#enabled:.							{	#model. 	#enabled				}.
			#encrypted:.						{ 	#model.	#encrypted			}.
			#borderWidth:.						#(model borderWidth).
			#borderColor:.						#(model borderColor).
			#setBalloonText:.					{ #model . #help}.
			#hResizing:. 							#spaceFill.
			#vResizing:. 							#spaceFill.
			#acceptOnCR:. 					{	#model. 	#acceptOnCR			}.
			#hideScrollBarsIndefinitely.}
]

{ #category : 'example' }
TextInputFieldModel class >> example [
	| instance |
	
	instance := self new.
	instance openWithSpec.
	instance ghostText: 'This is a ghost'.
	instance text: 'This is a text'
]

{ #category : 'specs' }
TextInputFieldModel class >> title [

	^ 'Text'
]

{ #category : 'morphic' }
TextInputFieldModel >> accept: aText [

	textHolder contents: aText.
	actionToPerformHolder contents cull: aText.
	self changed: #clearUserEdits.
]

{ #category : 'protocol' }
TextInputFieldModel >> acceptOnCR [
	<api: #inspect>
	"Return true if the text is accepted when the Enter key is stroked"

	^ acceptOnCR contents
]

{ #category : 'protocol' }
TextInputFieldModel >> acceptOnCR: aBoolean [
	<api: #boolean getter: #acceptOnCR registration: #whenAcceptOnCRChanged:>
	"Set if the text is accepted when the Enter key is stroked or not"

	acceptOnCR contents: aBoolean
]

{ #category : 'accessing' }
TextInputFieldModel >> actionToPerformHolder [

	^ actionToPerformHolder
]

{ #category : 'protocol' }
TextInputFieldModel >> autoAccept [ 
	<api: #inspect>
	"Return true if the text is accepted after ech keystroke"

	^ autoAccept contents
]

{ #category : 'protocol' }
TextInputFieldModel >> autoAccept: aBoolean [
	<api: #boolean getter: #autoAccept registration: #whenAutoAcceptChanged:>
	"Set if the text is accepted after each keystroke or not"

	autoAccept contents: aBoolean.
]

{ #category : 'protocol' }
TextInputFieldModel >> beDecrypted [
	<api: #do>
	"Decrypt the entered text"
	
	self encrypted: false
]

{ #category : 'protocol' }
TextInputFieldModel >> beEncrypted [
	<api: #do>
	"Encrypt the entered text"
	
	self encrypted: true
]

{ #category : 'private' }
TextInputFieldModel >> defaultEntryCompletion [

	| applicants |
	applicants := (Array
				streamContents: [:strm | Symbol
						allSymbolTablesDo: [:each | (each notEmpty
									and: [each first canBeGlobalVarInitial
											and: [Smalltalk globals includesKey: each]])
								ifTrue: [strm nextPut: each]]]) sort.

	^ EntryCompletion new
				dataSourceBlock: [:currText | applicants];
				filterBlock: [:currApplicant :currText | currText size > 3
						and: [currApplicant asUppercase includesSubstring: currText asString asUppercase]].
]

{ #category : 'accessing' }
TextInputFieldModel >> encrypted [

	^ isEncrypted contents
]

{ #category : 'accessing' }
TextInputFieldModel >> encrypted: aBoolean [

	isEncrypted contents: aBoolean 
]

{ #category : 'protocol' }
TextInputFieldModel >> entryCompletion [
	<api: #st getter: #entryCompletion registration: #whenEntryCompletionChanged:>
	"Return an entry completion used to suggest text while typing"

	^ entryCompletion contents
]

{ #category : 'protocol' }
TextInputFieldModel >> entryCompletion: anEntryCompletion [
	<api: #st getter: #entryCompletion registration: #whenEntryCompletionChanged:>
	"Set an entry completion used to suggest text while typing"

	entryCompletion contents: anEntryCompletion.
]

{ #category : 'protocol' }
TextInputFieldModel >> ghostText [
	<api: #inspect>
	"Return the ghost text of the text zone"

	^ ghostText contents
]

{ #category : 'protocol' }
TextInputFieldModel >> ghostText: aText [
	<api: #string getter: #ghostText registration: #whenGhostTextChanged:>
	"Set the ghost text of the text zone"

	ghostText contents: aText translated.
]

{ #category : 'initialization' }
TextInputFieldModel >> initialize [
	"Initialization code for TextComposableModel"

	super initialize.
	
	ghostText := '' asValueHolder.
	acceptOnCR := true asValueHolder.
	autoAccept := false asValueHolder.
	entryCompletion := self defaultEntryCompletion asValueHolder.
	isEncrypted := false asValueHolder.
	
	ghostText  whenChangedDo: [:txt | self widget ifNotNil: [:w | w ghostText: txt ]].
	acceptOnCR whenChangedDo: [:bool | self widget ifNotNil: [:w | w acceptOnCR: bool ]].
	autoAccept whenChangedDo: [:bool | self widget ifNotNil: [:w | w autoAccept: bool ]].
	isEncrypted whenChangedDo: [:bool | self widget ifNotNil: [:w | w encrypted: bool ]].
]

{ #category : 'NOCompletion' }
TextInputFieldModel >> isCodeCompletionAllowed [
	
	^ false
]

{ #category : 'protocol' }
TextInputFieldModel >> removeEntryCompletion [
	< api:#do>
	"Remove the entry completion"
	
	self entryCompletion: nil
]

{ #category : 'accessing' }
TextInputFieldModel >> textHolder [

	^ textHolder
]

{ #category : 'protocol-events' }
TextInputFieldModel >> whenAcceptOnCRChanged: aBlock [
	<api: #event>
	"aBlock will be performed when acceptOnCR changed"
	
	acceptOnCR whenChangedDo: aBlock
]

{ #category : 'protocol-events' }
TextInputFieldModel >> whenAutoAcceptChanged: aBlock [
	<api: #event>
	"aBlock will be performed when autoAccept changed"
	
	autoAccept whenChangedDo: aBlock
]

{ #category : 'protocol-events' }
TextInputFieldModel >> whenEntryCompletionChanged: aBlock [
	<api: #event>
	"aBlock will be performed when entryCompletion changed"
	
	entryCompletion whenChangedDo: aBlock
]

{ #category : 'protocol-events' }
TextInputFieldModel >> whenGhostTextChanged: aBlock [
	<api: #event>
	"aBlock will be performed when ghostText changed"
	
	ghostText whenChangedDo: aBlock
]
