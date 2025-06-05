"
A ButtonComposableModel is an applicative model which handle a basic button.

self example
"
Class {
	#name : 'ButtonModel',
	#superclass : 'AbstractBasicWidget',
	#instVars : [
		'actionHolder',
		'labelHolder',
		'stateHolder',
		'actionPerformedHolder',
		'askBeforeChangingHolder'
	],
	#category : 'Spec-Widgets'
}

{ #category : 'specs' }
ButtonModel class >> defaultSpec [
	<spec>
	^ {#ButtonSpec.
	    		#on:getState:action:label:menu:. 	#model. #state. #action. #label. #nil.
			#getEnabledSelector:. 				#enabled.
			#hResizing:. 						#spaceFill.
			#vResizing:. 						#spaceFill.
			#borderWidth:.						#(model borderWidth).
			#borderColor:.						#(model borderColor).
			#askBeforeChanging:.				#(model askBeforeChanging).
			#setBalloonText:.					{ #model . #help}.
			#eventHandler:.					{	#EventHandler. #on:send:to:. #keyStroke.	#keyStroke:fromMorph:. #model	}}
]

{ #category : 'example' }
ButtonModel class >> example [

	| b |
	b:= ButtonModel new.
	b openWithSpec.
	b label: 'Click me'.
]

{ #category : 'specs' }
ButtonModel class >> title [

	^ 'Button'
]

{ #category : 'morphic' }
ButtonModel >> action [

	self widget ifNotNil: [:m | m takeKeyboardFocus ].
	actionHolder contents value.
	" Here I set a dummy value just to make the holder raise an event "
	actionPerformedHolder contents: nil.
]

{ #category : 'protocol' }
ButtonModel >> action: aBlock [
	<api: #block getter: #getAction registration: #whenActionChangedDo:>
	"set the block performed when the button is clicked"

	actionHolder contents: aBlock
]

{ #category : 'protocol' }
ButtonModel >> askBeforeChanging [

	^ askBeforeChangingHolder contents
]

{ #category : 'protocol' }
ButtonModel >> askBeforeChanging: aBoolean [

	askBeforeChangingHolder contents: aBoolean
]

{ #category : 'focus' }
ButtonModel >> eventKeyStrokeForNextFocus [
	"String describing the keystroke to perform to jump to the next widget"
	^ Character arrowRight asShortcut
]

{ #category : 'focus' }
ButtonModel >> eventKeyStrokeForPreviousFocus [
	"String describing the keystroke to perform to jump to the previous widget"
	^ Character arrowLeft asShortcut
]

{ #category : 'protocol' }
ButtonModel >> getAction [
	<api: #inspect>
	"get the block performed when the button is clicked"

	^ actionHolder contents
]

{ #category : 'initialization' }
ButtonModel >> initialize [
	"Initialization code for ButtonComposableModel"

	super initialize.

	actionHolder := [] asValueHolder.
	labelHolder := '' asValueHolder.
	stateHolder := true asValueHolder.
	enabledHolder := true asValueHolder.
	helpHolder := nil asValueHolder.
	actionPerformedHolder := nil asValueHolder.
	askBeforeChangingHolder := false asValueHolder.
	
	labelHolder whenChangedDo: [	self changed: #label ].
	stateHolder whenChangedDo: [	self changed: #state ].
	enabledHolder whenChangedDo: [	self changed: #enabled ].
	askBeforeChangingHolder 
		whenChangedDo: [:newValue | self widget 
											ifNotNil: [:widget | widget askBeforeChanging: newValue ]].
	
		
	self on: Character space asShortcut do: [ self action ].
]

{ #category : 'morphic' }
ButtonModel >> label [
	<api: #inspect>
	^ labelHolder contents
]

{ #category : 'protocol' }
ButtonModel >> label: aStringOrImageMorph [
	<api: #string getter: #label registration: #whenLabelChangedDo:>

	labelHolder contents: aStringOrImageMorph
]

{ #category : 'morphic' }
ButtonModel >> state [
	<api: #inspect>
	^ stateHolder contents
]

{ #category : 'protocol' }
ButtonModel >> state: aBoolean [
	<api: #boolean getter: #state registration: #whenStateChangedDo:>
	"set if the button is highlighted"
	
	^ stateHolder contents: aBoolean
]

{ #category : 'protocol-events' }
ButtonModel >> whenActionChangedDo: aBlock [ 

	actionHolder whenChangedDo: aBlock
]

{ #category : 'protocol-events' }
ButtonModel >> whenActionPerformedDo: aBlock [
	<api: #event>
	"set a block to perform after that the button has been aclicked, and its action performed"

	actionPerformedHolder whenChangedDo: aBlock
]

{ #category : 'protocol-events' }
ButtonModel >> whenLabelChangedDo: aBlock [
	<api: #event>
	"set a block to perform after that the button has been aclicked, and its action performed"

	labelHolder whenChangedDo: aBlock
]

{ #category : 'protocol-events' }
ButtonModel >> whenStateChangedDo: aBlock [
	<api: #event>
	"set a block to perform after that the button has been aclicked, and its action performed"

	stateHolder whenChangedDo: aBlock
]
