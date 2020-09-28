"
I handle basic multi-line text. Try:
	""self example""
"
Class {
	#name : #TextModel,
	#superclass : #AbstractBasicWidget,
	#instVars : [
		'aboutToStyleHolder',
		'behaviorHolder',
		'textHolder',
		'actionToPerformHolder',
		'readSelectionHolder',
		'actionPerformedHolder',
		'isCodeCompletionAllowedHolder',
		'doItContext',
		'doItReceiver'
	],
	#category : 'Spec-Widgets'
}

{ #category : #specs }
TextModel class >> defaultSpec [
	<spec>
	
	^ SpecLayout text
			send: #classOrMetaClass: withArguments: {#(model behavior)};
			send: #on:text:accept:readSelection:menu: withArguments: #(model getText accept:notifying: readSelection codePaneMenu:shifted:);
			
			send: #enabled: withArguments: {#(model enabled)};
			send: #borderWidth: withArguments: #(#(model borderWidth));
			send: #borderColor: withArguments: #(#(model borderColor));
			send:#setBalloonText: withArguments:	{ #(model help)};
			send: #vSpaceFill;
			send: #hSpaceFill;
			yourself
]

{ #category : #example }
TextModel class >> example [

	| instance |	
	instance := self new.
	instance openWithSpec.
	instance text: 'This is a test.
If this had been an actual emergency...'.
]

{ #category : #specs }
TextModel class >> title [

	^ 'Text'
]

{ #category : #'protocol-shout' }
TextModel >> aboutToStyle: aBoolean [	
	<api: #boolean getter: #isAboutToStyle registration: #whenAboutToStyleChanged:>
	"Set if the text zone must be styled"
	
	aboutToStyleHolder contents: [ aBoolean ]
]

{ #category : #'protocol-shout' }
TextModel >> aboutToStyleBlock [
	<api: #inspect>
	"Return the block used to know if the text must be styled"	

	^ aboutToStyleHolder contents
]

{ #category : #'protocol-shout' }
TextModel >> aboutToStyleBlock: aBlockReturningABoolean [
	<api: #block getter: #aboutToStyleBlock registration: #whenAboutToStyleBlockChanged:>
	"Set the block used to know if the text must be styled.
	The block must return a boolean"

	aboutToStyleHolder contents: aBlockReturningABoolean
]

{ #category : #protocol }
TextModel >> accept [
	<api: #do>
	"Accep the current pendingtext"
	
	self widget ifNotNil: [:w | w accept ]
]

{ #category : #morphic }
TextModel >> accept: aText notifying: aNotifyier [

	textHolder contents: aText.
	actionToPerformHolder contents cull: aText cull: aNotifyier.
	
	"Dummy changed to raise an announcement"
	actionPerformedHolder contents: nil.
	self changed: #clearUserEdits.
]

{ #category : #protocol }
TextModel >> acceptBlock [
	<api: #inspect>
	"Return the block to perform when the text is accepted.
	The block must have one argument, which will be the accepted text"

	^ actionToPerformHolder contents
]

{ #category : #protocol }
TextModel >> acceptBlock: aBlockWithOneArgument [
	<api: #block getter: #acceptBlock registration: #whenAcceptBlockChanged:>
	"Set the block to perform when the text is accepted.
	The block must have one argument, which will be the accepted text"

	actionToPerformHolder contents: aBlockWithOneArgument
]

{ #category : #'protocol-shout' }
TextModel >> behavior [
	<api: #inspect>
	"Return the class corresponding to the method class of the source code you are editing"
	
	^ behaviorHolder contents
]

{ #category : #'protocol-shout' }
TextModel >> behavior: aClass [
	< api: #st getter: #behavior registration: #whenBehaviorChanged:>
	"Set the class corresponding to the method class of the source code you are editing"

	behaviorHolder contents: aClass
]

{ #category : #morphic }
TextModel >> clearUserEditFlag [
	
	self text: self getText.
	self changed: #clearUserEdits
]

{ #category : #morphic }
TextModel >> codePaneMenu: aMenu shifted: shifted [ 
	"Note that unless we override perform:orSendTo:, 
	PluggableTextController will respond to all menu items in a 
	text pane"
	
	^ shifted
			ifTrue: [SmalltalkEditor shiftedYellowButtonMenu]
			ifFalse: [SmalltalkEditor yellowButtonMenu].
]

{ #category : #morphic }
TextModel >> doItContext [

	^ doItContext contents
]

{ #category : #morphic }
TextModel >> doItContext: anObject [

	doItContext contents: anObject
]

{ #category : #morphic }
TextModel >> doItReceiver [

	^ doItReceiver contents
]

{ #category : #morphic }
TextModel >> doItReceiver: anObject [

	doItReceiver contents: anObject
]

{ #category : #focus }
TextModel >> eventKeyStrokeForNextFocus [
	"String describing the keystroke to perform to jump to the next widget"
	^ Character arrowRight command ctrl asShortcut
]

{ #category : #focus }
TextModel >> eventKeyStrokeForPreviousFocus [
	"String describing the keystroke to perform to jump to the previous widget"

	^ Character arrowLeft command ctrl asShortcut
]

{ #category : #protocol }
TextModel >> getSelection [
	<api:#inspect>
	"Get the text selection"

	^ self widget
		ifNil: [ self readSelection ]
		ifNotNil: [:w | w selectionInterval ]
]

{ #category : #morphic }
TextModel >> getText [
	<api: #inspect>	
	^ textHolder contents
]

{ #category : #NOCompletion }
TextModel >> guessTypeForName: aString [

	^nil
]

{ #category : #protocol }
TextModel >> hasEditingConflicts [
	<api:#inspect>
	"Return if the text zone has editing conflicts"

	^ self widget 
		ifNil: [ false ]
		ifNotNil: [:w | w hasEditingConflicts ]
]

{ #category : #protocol }
TextModel >> hasEditingConflicts: aBoolean [
	<api:#boolean getter: #hasEditingConflicts>
	"Set if the text zone has editing conflicts"

	^ self widget 
		ifNil: [ false ]
		ifNotNil: [:w | w hasEditingConflicts: aBoolean ]
]

{ #category : #protocol }
TextModel >> hasUnacceptedEdits [
	<api:#inspect>
	"Return if the text zone has unaccepted edits (orange corner)"

	^ self widget 
		ifNil: [ false ]
		ifNotNil: [:w | w hasUnacceptedEdits ]
]

{ #category : #protocol }
TextModel >> hasUnacceptedEdits: aBoolean [
	<api:#boolean getter: #hasUnacceptedEdits>
	"Return if the text zone has unaccepted edits (orange corner)"

	^ self widget 
		ifNil: [ false ]
		ifNotNil: [:w | w hasUnacceptedEdits: aBoolean ]
]

{ #category : #initialization }
TextModel >> initialize [
	"Initialization code for TextComposableModel"

	super initialize.
	
	textHolder := '' asValueHolder.
	behaviorHolder := nil asValueHolder.
	aboutToStyleHolder := [ false ] asValueHolder.
	actionToPerformHolder := [ :text |  ] asValueHolder.
	readSelectionHolder := [ 1 to: 0 ] asValueHolder.
	enabledHolder := true asValueHolder.
	actionPerformedHolder := nil asValueHolder.
	isCodeCompletionAllowedHolder := true asValueHolder.
	doItContext := nil asValueHolder.
	doItReceiver := nil asValueHolder.
	
	self registerEvents.
	self registerEventsForShout
]

{ #category : #'protocol-shout' }
TextModel >> isAboutToStyle [
	< api: #inspect>
	"Return if the text zone is shouted or not"

	^ self aboutToStyleBlock value
]

{ #category : #NOCompletion }
TextModel >> isCodeCompletionAllowed [
	<api:#inspect>
	"Return if code completion is allowed"
	
	^ isCodeCompletionAllowedHolder contents
]

{ #category : #protocol }
TextModel >> isCodeCompletionAllowed: aBoolean [
	<api: #boolean getter: #isCodeCompletionAllowed registration: #whenCodeCompletionAllowedChanged:>
	"Set if code completion is allowed"
	
	isCodeCompletionAllowedHolder contents: aBoolean
]

{ #category : #'private-shout' }
TextModel >> okToStyle [

	^ true
]

{ #category : #protocol }
TextModel >> pendingText [
	<api: #inspect>
	"Return the current pending text"

	self widget
		ifNil: [ ^ self getText ]
		ifNotNil: [:w |  ^ w text ]
]

{ #category : #protocol }
TextModel >> pendingText: aText [
	<api: #string getter: #pendingText>
	"Set the pending text. Do no accept it"

	self widget
		ifNil: [ self text: aText ]
		ifNotNil: [:w |
			w setText: aText.
			w hasUnacceptedEdits: true ]
]

{ #category : #morphic }
TextModel >> readSelection [
	<api: #inspect>
	^ readSelectionHolder contents cull: (self widget ifNil: [ nil ] ifNotNil: [:w | w text ]) cull: self
]

{ #category : #protocol }
TextModel >> readSelectionBlock [
	<api: #inspect>
	"Return the block used to calculate the text selection"

	^ readSelectionHolder contents
]

{ #category : #protocol }
TextModel >> readSelectionBlock: aBlock [
	<api: #block getter: #readSelectionBlock registration: #whenReadSelectionIsChanged:>
	"Set the block used to calculate the text selection"

	^ readSelectionHolder contents: aBlock
]

{ #category : #NOCompletion }
TextModel >> receiverClass [

	^ self behavior
]

{ #category : #initialization }
TextModel >> registerEvents [

	textHolder whenChangedDo: [ self changed: #getText ].
	readSelectionHolder whenChangedDo: [ self changed: #readSelection ].
	enabledHolder whenChangedDo: [ :bool | self widget ifNotNil: [:w | w enabled: bool ] ]
]

{ #category : #initialization }
TextModel >> registerEventsForShout [
	aboutToStyleHolder whenChangedDo: [ self changed: #getText ].
	behaviorHolder
		whenChangedDo: [ :class | 
			self widget ifNotNil: [ :w | w classOrMetaClass: class ].
			self changed: #getText ]
]

{ #category : #morphic }
TextModel >> selectedBehavior [

	^ behaviorHolder contents
]

{ #category : #NOCompletion }
TextModel >> selectedClassOrMetaClass [

	^ self behavior
]

{ #category : #protocol }
TextModel >> setSelection: anInterval [
	<api: #st getter: #getSelection>
	"Set the text selection without changing the readSelectionBlock"

	self readSelectionBlock: [ anInterval ].
	self widget
		ifNotNil: [:w | w setSelection: anInterval ]
]

{ #category : #morphic }
TextModel >> shoutAboutToStyle: aMorph [
	
	^ self isAboutToStyle
]

{ #category : #'morphic-polymorphism' }
TextModel >> text [

	^ self getText
]

{ #category : #protocol }
TextModel >> text: aText [
	<api: #string getter: #getText registration: #whenTextChanged:>
	"Set the text of the text zone"
	
	textHolder contents: aText
]

{ #category : #'protocol-events' }
TextModel >> whenAboutToStyleBlockChanged: aBlock [
	<api: #event>
	"Set a block to perform when the about to style block changed"
	
	aboutToStyleHolder whenChangedDo: aBlock
]

{ #category : #'protocol-events' }
TextModel >> whenAboutToStyleChanged: aBlock [
	<api: #event>
	"Set a block to perform when the about to style block changed"
	
	self whenAboutToStyleBlockChanged: [:block :old :announcement :announcer | 
		aBlock cull: (block value) cull: old cull: announcement cull: announcer ]
]

{ #category : #'protocol-events' }
TextModel >> whenAcceptBlockChanged: aBlock [
	<api: #event>
	"Set a block to perform when the accept block changed"
	
	actionToPerformHolder whenChangedDo: aBlock
]

{ #category : #'protocol-events' }
TextModel >> whenBehaviorChanged: aBlock [
	<api: #event>
	"Set a block to perform when the behavior class changed"
	
	behaviorHolder whenChangedDo: aBlock
]

{ #category : #'protocol-events' }
TextModel >> whenCodeCompletionAllowedChanged: aBlock [
	<api: #event>
	"Set a block to perform when the code completion value changed"
	
	actionPerformedHolder whenChangedDo: aBlock
]

{ #category : #'protocol-events' }
TextModel >> whenReadSelectionIsChanged: aBlock [
	<api: #event>
	"Set a block to perform when the read selection block changed"
	
	readSelectionHolder whenChangedDo: aBlock
]

{ #category : #'protocol-events' }
TextModel >> whenTextChanged: aBlock [
	<api: #event>
	"Set a block to perform when the text changed"
	
	textHolder whenChangedDo: aBlock
]

{ #category : #'protocol-events' }
TextModel >> whenTextIsAccepted: aBlock [
	<api: #event>
	"Set a block to perform when the text is accepted"
	
	actionPerformedHolder whenChangedDo: aBlock
]
