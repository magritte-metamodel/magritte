"
A RadioButtonModel is a spec model for RadioButton

! The method privateSetState: is really private and should only be used by RadioButtonGroup !

You can also have a look at RadioButtonGroupExample for a full example of how to use them with a group.
"
Class {
	#name : 'RadioButtonModel',
	#superclass : 'AbstractBasicWidget',
	#instVars : [
		'actionWhenActivatedHolder',
		'actionWhenDesactivatedHolder',
		'stateHolder',
		'labelClickableHolder',
		'labelHolder'
	],
	#category : 'Spec-Widgets'
}

{ #category : 'specs' }
RadioButtonModel class >> defaultSpec [
	<spec>
	^ {#CheckboxSpec.
	    		#on:selected:changeSelected:. 	#model. #state. #state:.
			#label:.								{	#model. #label		}.
			#labelClickable:.					{	#model. #labelClickable}.
			#beRadioButton.
			#hResizing:. 						#shrinkWrap.
			#vResizing:. 						#shrinkWrap.
			#setBalloonText:.					{ #model . #help}.
			#borderWidth:.						#(model borderWidth).
			#borderColor:.						#(model borderColor)}
]

{ #category : 'specs' }
RadioButtonModel class >> title [

	^ 'Radio Button'
]

{ #category : 'accessing' }
RadioButtonModel >> actionWhenActivatedHolder [
	
	^ actionWhenActivatedHolder
]

{ #category : 'accessing' }
RadioButtonModel >> actionWhenDesactivatedHolder [
	
	^ actionWhenDesactivatedHolder
]

{ #category : 'protocol' }
RadioButtonModel >> activationAction: aBlock [
	<api: #block getter: #activationAction registration: #whenActivationActionChanged:>
	"This method is used to set the action to perform when I am activated"
	
	actionWhenActivatedHolder contents: aBlock
]

{ #category : 'protocol' }
RadioButtonModel >> click [
	<api: #do>
	"Simulate a click on the radioButton.
	Used when the checkboc is a list item"

	self toggleState
]

{ #category : 'protocol' }
RadioButtonModel >> desactivationAction: aBlock [
	<api: #block getter: #desactivationAction registration: #whenDesactivationActionChanged:>
	"This method is used to set the action to perform when I am desactivated"
	
	actionWhenDesactivatedHolder contents: aBlock
]

{ #category : 'accessing' }
RadioButtonModel >> enabledHolder [
	
	^ enabledHolder
]

{ #category : 'focus' }
RadioButtonModel >> eventKeyStrokeForNextFocus [
	"String describing the keystroke to perform to jump to the next widget"
	^ Character arrowRight asShortcut
]

{ #category : 'focus' }
RadioButtonModel >> eventKeyStrokeForPreviousFocus [
	"String describing the keystroke to perform to jump to the previous widget"
	^ Character arrowLeft asShortcut
]

{ #category : 'initialization' }
RadioButtonModel >> initialize [
	"initialization code for CheckBox"

	super initialize.
	
	actionWhenActivatedHolder := [] asValueHolder.
	actionWhenDesactivatedHolder := [] asValueHolder.
	enabledHolder := true asValueHolder.
	stateHolder := false asValueHolder.
	labelClickableHolder := true asValueHolder. 
	labelHolder := '' asValueHolder.
	stateHolder whenChangedDo: [:bool |
		bool
			ifTrue: actionWhenActivatedHolder contents
			ifFalse: actionWhenDesactivatedHolder contents.
		self changed: #state ].
	labelClickableHolder whenChangedDo: [:aBoolean |
		self widget ifNotNil: [:w | w labelClickable: aBoolean ]].
	labelHolder whenChangedDo: [:label |
		self widget ifNotNil: [:w | w label: label ]].
	
]

{ #category : 'morphic' }
RadioButtonModel >> label [
	<api: #inspect>
	^ labelHolder contents
]

{ #category : 'protocol' }
RadioButtonModel >> label: aString [
	<api: #string getter: #label registration: #whenLabelChanged:>
	"Set the label of the radioButton"

	labelHolder contents: aString.
]

{ #category : 'morphic' }
RadioButtonModel >> labelClickable [
	<api: #inspect>
	"Return true if the label can be clicked to select the radioButton"

	^ labelClickableHolder contents
]

{ #category : 'protocol' }
RadioButtonModel >> labelClickable: aBoolean [
	<api: #boolean getter: #labelClickable registration: #whenLabelClickableChanged:>
	"Set if the label can be clicked to select the radioButton"
	
	labelClickableHolder contents: aBoolean
]

{ #category : 'private' }
RadioButtonModel >> privateSetState: aBoolean [
	"Should only be used by RadioButtonGroup"
	
	stateHolder contents: aBoolean.
	self changed: #state
]

{ #category : 'morphic' }
RadioButtonModel >> state [
	<api: #inspect>
	"Return the current state of the radio button"

	^ stateHolder contents
]

{ #category : 'morphic' }
RadioButtonModel >> state: aBoolean [
	<api: #boolean getter: #state>
	"Set if the checkbox is activated or not"

	stateHolder contents: aBoolean
]

{ #category : 'accessing' }
RadioButtonModel >> stateHolder [
	
	^ stateHolder
]

{ #category : 'protocol' }
RadioButtonModel >> toggleState [
	"Toogle the current state of the radioButton"

	self state: self state not
]

{ #category : 'protocol-events' }
RadioButtonModel >> whenActivatedDo: aBlock [
	"This method is used to propagate the event that I have been activated" 
	
	stateHolder whenChangedDo: [:bool | bool ifTrue: aBlock ]
]

{ #category : 'protocol-events' }
RadioButtonModel >> whenActivationActionChanged: aBlock [
	<api: #event>
	"A block performed when the activation action changed"
	actionWhenActivatedHolder whenChangedDo:  aBlock 
]

{ #category : 'protocol-events' }
RadioButtonModel >> whenChangedDo: aBlock [
	<api: #event>
	"This method is used to propagate the event that I have changed"
	
	stateHolder whenChangedDo: aBlock
]

{ #category : 'protocol-events' }
RadioButtonModel >> whenDesactivatedDo: aBlock [
	"This method is used to propagate the event that I have been desactivated"
	
	stateHolder whenChangedDo: [:bool | bool ifFalse: aBlock ]
]

{ #category : 'protocol-events' }
RadioButtonModel >> whenDesactivationActionChanged: aBlock [
	<api: #event>
	"A block performed when the desactivation action changed"
	actionWhenDesactivatedHolder whenChangedDo:  aBlock 
]

{ #category : 'protocol-events' }
RadioButtonModel >> whenLabelChanged: aBlock [
	"A block performed when the label changed"
	<api: #event>
	
	labelHolder whenChangedDo:  aBlock 
]

{ #category : 'protocol-events' }
RadioButtonModel >> whenLabelClickableChanged: aBlock [
	"A block performed when the label click is activated or descativated"
	<api: #event>
	
	labelClickableHolder whenChangedDo:  aBlock 
]
