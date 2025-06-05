"
An OkCancelToolbar is a model for a basic Ok-Cancel toolbar
"
Class {
	#name : 'OkCancelToolbar',
	#superclass : 'OkToolbar',
	#instVars : [
		'cancelButton',
		'cancelAction',
		'cancelled'
	],
	#category : 'Spec-Widgets-PolyWidgets'
}

{ #category : 'specs' }
OkCancelToolbar class >> defaultSpec [
	<spec>
	^ { #Panel.
			#changeTableLayout.
			#listDirection:.		#rightToLeft.
			#add:. {#model.	#hFill}.
			#add:. {#model.	#hFill}.
			#add:. {#model.	#hFill}.
			#add:. {#model.	#hFill}.
			#add:. {#model.	#hFill}.
			#add:. {#model.	#hFill}.
			#add:. {#model.	#okButton.	}.
			#add:. {#model.	#cancelButton.}.
			#hSpaceFill.
			#vShrinkWrap.	}
]

{ #category : 'specs' }
OkCancelToolbar class >> title [

	^ 'Ok Cancel'
]

{ #category : 'protocol' }
OkCancelToolbar >> cancelAction [

	^ cancelAction contents
]

{ #category : 'protocol' }
OkCancelToolbar >> cancelAction: aBlock [

	^ cancelAction contents: aBlock
]

{ #category : 'accessing' }
OkCancelToolbar >> cancelButton [

	^ cancelButton
]

{ #category : 'protocol' }
OkCancelToolbar >> cancelled [

	^ cancelled contents
]

{ #category : 'initialization' }
OkCancelToolbar >> initialize [
	"Initialization code for OkCancelToolbar"

	cancelled := false asValueHolder.
	cancelAction := [ true ] asValueHolder.
	super initialize.
]

{ #category : 'initialization' }
OkCancelToolbar >> initializePresenter [ 

	super initializePresenter.
	cancelButton 
		action: [
			cancelAction contents value == false
					ifFalse: [
						cancelled contents: true.
						owner 
							ifNil: [ self delete ]
							ifNotNil: [ owner delete ]]].
]

{ #category : 'initialization' }
OkCancelToolbar >> initializeWidgets [

	super initializeWidgets.
	self instantiateModels: #( cancelButton ButtonModel ).

	self registerCancelButtonEvents.
	self focusOrder
		add: cancelButton
]

{ #category : 'initialization' }
OkCancelToolbar >> registerCancelButtonEvents [

	cancelButton 
		label: 'Cancel';
		enabled: true;
		state: false
]
