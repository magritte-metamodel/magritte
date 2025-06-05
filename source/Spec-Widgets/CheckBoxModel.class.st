"
A CheckboxModel is a spec model for Checkbox

You can also have a look at CheckBoxExample for a full example of how to use them with a group.

"
Class {
	#name : 'CheckBoxModel',
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
CheckBoxModel class >> defaultSpec [
	<spec>
	^ {#CheckboxSpec.
	    		#on:selected:changeSelected:. 	#model. #state. #state:.
			#label:.								{	#model. #label		}.
			#beCheckbox.
			#hResizing:. 						#shrinkWrap.
			#vResizing:. 						#shrinkWrap.
			#setBalloonText:.					{ #model . #help}.
			#borderWidth:.						#(model borderWidth).
			#borderColor:.						#(model borderColor).
			#labelClickable:.					{	#model. #labelClickable}.}
]

{ #category : 'specs' }
CheckBoxModel class >> title [

	^ 'Checkbox Button'
]

{ #category : 'protocol' }
CheckBoxModel >> activationAction: aBlock [
	<api: #block getter: #activationAction registration: #whenActivationActionChanged:>
	"This method is used to set the action to perform when I am activated"
	
	actionWhenActivatedHolder contents: aBlock
]

{ #category : 'protocol' }
CheckBoxModel >> click [
	<api: #do>
	"Simulate a click on the checkbox
	Used when the checkboc is a list item"

	self toggleState
]

{ #category : 'protocol' }
CheckBoxModel >> desactivationAction: aBlock [
	<api: #block getter: #desactivationAction registration: #whenDesactivationActionChanged:>
	"This method is used to set the action to perform when I am desactivated"
	
	actionWhenDesactivatedHolder contents: aBlock
]

{ #category : 'focus' }
CheckBoxModel >> eventKeyStrokeForNextFocus [
	"String describing the keystroke to perform to jump to the next widget"
	^ Character arrowRight asShortcut
]

{ #category : 'focus' }
CheckBoxModel >> eventKeyStrokeForPreviousFocus [
	"String describing the keystroke to perform to jump to the previous widget"
	^ Character arrowLeft asShortcut
]

{ #category : 'initialization' }
CheckBoxModel >> initialize [
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
CheckBoxModel >> label [
	<api: #inspect>
	^ labelHolder contents
]

{ #category : 'protocol' }
CheckBoxModel >> label: aString [
	<api: #string getter: #label registration: #whenLabelChanged:>
	"Set the label of the checkbox"

	labelHolder contents: aString.
]

{ #category : 'morphic' }
CheckBoxModel >> labelClickable [
	<api: #inspect>
	"Return true if the label can be clicked to select the checkbox"

	^ labelClickableHolder contents
]

{ #category : 'protocol' }
CheckBoxModel >> labelClickable: aBoolean [
	<api: #boolean getter: #labelClickable registration: #whenLabelClickableChanged:>
	"Set if the label can be clicked to select the checkbox"
	
	labelClickableHolder contents: aBoolean
]

{ #category : 'morphic' }
CheckBoxModel >> state [
	<api: #inspect>
	"Return the current state of the checkBox"
	
	^ stateHolder contents
]

{ #category : 'morphic' }
CheckBoxModel >> state: aBoolean [
	<api: #boolean getter: #state>
	"Set if the checkbox is activated or not"

	stateHolder contents: aBoolean
]

{ #category : 'protocol' }
CheckBoxModel >> toggleState [
	<api: #do>
	"Toogle the current state of the checkbox"

	self state: self state not
]

{ #category : 'protocol-events' }
CheckBoxModel >> whenActivatedDo: aBlock [
	<api: #event>
	"This method is used to propagate the event that I have been activated" 
	
	stateHolder whenChangedDo: [:bool | bool ifTrue: aBlock ]
]

{ #category : 'protocol-events' }
CheckBoxModel >> whenActivationActionChanged: aBlock [
	<api: #event>
	"A block performed when the activation action changed"
	actionWhenActivatedHolder whenChangedDo:  aBlock 
]

{ #category : 'protocol-events' }
CheckBoxModel >> whenChangedDo: aBlock [
	<api: #event>
	"This method is used to propagate the event that I have changed"
	
	stateHolder whenChangedDo: aBlock
]

{ #category : 'protocol-events' }
CheckBoxModel >> whenDesactivatedDo: aBlock [
	<api: #event>
	"This method is used to propagate the event that I have been desactivated"
	
	stateHolder whenChangedDo: [:bool | bool ifFalse: aBlock ]
]

{ #category : 'protocol-events' }
CheckBoxModel >> whenDesactivationActionChanged: aBlock [
	<api: #event>
	"A block performed when the desactivation action changed"
	actionWhenDesactivatedHolder whenChangedDo:  aBlock 
]

{ #category : 'protocol-events' }
CheckBoxModel >> whenLabelChanged: aBlock [
	"A block performed when the label changed"
	<api: #event>
	
	labelHolder whenChangedDo:  aBlock 
]

{ #category : 'protocol-events' }
CheckBoxModel >> whenLabelClickableChanged: aBlock [
	"A block performed when the label click is activated or descativated"
	<api: #event>
	
	labelClickableHolder whenChangedDo:  aBlock 
]
