"
An OkCancelToolbar is a model for a basic Ok toolbar
"
Class {
	#name : 'OkToolbar',
	#superclass : 'ComposableModel',
	#instVars : [
		'okButton',
		'okAction'
	],
	#category : 'Spec-Widgets-PolyWidgets'
}

{ #category : 'specs' }
OkToolbar class >> defaultSpec [
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
			#add:. {#model.	#hFill}.
			#add:. {#model.	#hFill}.
			#add:. {#model.	#hFill}.
			#add:. {#model.	#okButton.}.
			#hSpaceFill.
			#vShrinkWrap.	}
]

{ #category : 'specs' }
OkToolbar class >> title [

	^ 'Ok Toolbar'
]

{ #category : 'private' }
OkToolbar >> addAll: aWindow  withSpec: aSpec [

	aWindow
		addMorph: (self buildWithSpec: aSpec)
		fullFrame: ((0@0 corner: 1@0) asLayoutFrame bottomOffset: 30).
]

{ #category : 'private' }
OkToolbar >> hFill [

	^ Morph new
		color: Color transparent;
		height: 0;
		vResizing: #rigid;
		hResizing: #spaceFill
]

{ #category : 'initialization' }
OkToolbar >> initialize [
	"Initialization code for OkCancelToolbar"

	super initialize.
	okAction := [ true ] asValueHolder.
]

{ #category : 'initialization' }
OkToolbar >> initializePresenter [ 

	okButton 
		action: [ 
				okAction contents value == false
					ifFalse: [
						owner 
							ifNil: [ self delete ]
							ifNotNil: [ owner delete ]]].
]

{ #category : 'initialization' }
OkToolbar >> initializeWidgets [
	
	
	self instantiateModels:  #( okButton ButtonModel ).
	self registerOkButtonEvents.
	
	self focusOrder
		add: okButton
]

{ #category : 'protocol' }
OkToolbar >> okAction [

	^ okAction contents
]

{ #category : 'protocol' }
OkToolbar >> okAction: aBlock [

	^ okAction contents: aBlock
]

{ #category : 'accessing' }
OkToolbar >> okButton [

	^ okButton
]

{ #category : 'initialization' }
OkToolbar >> registerOkButtonEvents [

	okButton 
		label: 'Ok';
		enabled: true;
		state: false
]
