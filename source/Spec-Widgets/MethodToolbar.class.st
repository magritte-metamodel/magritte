"
A MethodToolbar is xxxxxxxxx.

| b |
b := MethodToolbar new.
b openWithSpec.
b method: (ButtonModel>>#state:).
b method: nil
"
Class {
	#name : #MethodToolbar,
	#superclass : #ComposableModel,
	#instVars : [
		'methodHolder',
		'browseModel',
		'sendersModel',
		'implementorsModel',
		'versionModel',
		'dropListModel',
		'model'
	],
	#category : 'Spec-Widgets-PolyWidgets'
}

{ #category : #specs }
MethodToolbar class >> defaultSpec [
	<spec>
	^ { #Panel.
			#changeTableLayout.
			#listDirection:.		#rightToLeft.
			#addMorph:. {#model.	#browseModel.}.
			#addMorph:. {#model.	#sendersModel.}.
			#addMorph:. {#model.	#implementorsModel.}.
			#addMorph:. {#model.	#versionModel.	}.
			#addMorph:. {#model.	#dropListModel.}.
			#hResizing:.	#spaceFill.
			#vResizing:.	#shrinkWrap.	}
]

{ #category : #specs }
MethodToolbar class >> title [

	^ 'Toolbar'
]

{ #category : #private }
MethodToolbar >> addAll: aWindow  withSpec: aSpec [

	aWindow
		addMorph: (self buildWithSpec: aSpec)
		fullFrame: ((0@0 corner: 1@0) asLayoutFrame bottomOffset: 30).
		
]

{ #category : #private }
MethodToolbar >> browseMethod [

	methodHolder contents
		ifNotNil: [:aMethod | aMethod browse ]
]

{ #category : #accessing }
MethodToolbar >> browseModel [

	^ browseModel
]

{ #category : #accessing }
MethodToolbar >> dropListModel [

	^ dropListModel
]

{ #category : #private }
MethodToolbar >> implementorsMethod [

	methodHolder contents
		ifNotNil: [:aMethod | self model browseMessagesFrom: aMethod selector ]
]

{ #category : #accessing }
MethodToolbar >> implementorsModel [

	^ implementorsModel
]

{ #category : #initialization }
MethodToolbar >> initialize [
	"Initialization code for MethodToolbar"

	methodHolder := nil asValueHolder.
	model := AbstractTool new.
	
	super initialize.
]

{ #category : #initialization }
MethodToolbar >> initializeWidgets [
	
	self instantiateModels: #(
		browseModel  			ButtonModel
		sendersModel  			ButtonModel
		implementorsModel  	ButtonModel
		versionModel  			ButtonModel
		dropListModel  		DropListModel ).
				
	self 
		setFocusOrder;
		setBrowseModel;
		setVersionModel;
		setSendersModel;
		setImplementorsModel

]

{ #category : #protocol }
MethodToolbar >> method: aMethod [

	methodHolder contents: aMethod
]

{ #category : #accessing }
MethodToolbar >> model [

	^ model
]

{ #category : #initialization }
MethodToolbar >> registerForChanges [

	methodHolder whenChangedDo: [:contents || boolean |
		boolean := contents
						ifNil: [ false ]
						ifNotNil: [ true ].
		browseModel state: boolean.
		sendersModel state: boolean.
		versionModel state: boolean.
		implementorsModel state: boolean]
]

{ #category : #private }
MethodToolbar >> sendersMethod [

	methodHolder contents
		ifNotNil: [:aMethod | self model browseSendersOfMessagesFrom: aMethod selector ]
]

{ #category : #accessing }
MethodToolbar >> sendersModel [

	^ sendersModel
]

{ #category : #initialization }
MethodToolbar >> setBrowseModel [
	
	browseModel
		state: false;
		label: 'Browse';
		action: [ self browseMethod ].
	

]

{ #category : #protocol }
MethodToolbar >> setDropListItems: aCollection [

	dropListModel items: aCollection
]

{ #category : #initialization }
MethodToolbar >> setFocusOrder [

	self focusOrder
		add: browseModel;
		add: sendersModel;
		add: implementorsModel;
		add: versionModel.
		
]

{ #category : #initialization }
MethodToolbar >> setImplementorsModel [
	
	implementorsModel
		state: false;
		label: 'Implementors';
		action: [ self implementorsMethod ].
	

]

{ #category : #initialization }
MethodToolbar >> setSendersModel [
	
	sendersModel
		state: false;
		label: 'Senders';
		action: [ self sendersMethod ].
	

]

{ #category : #initialization }
MethodToolbar >> setVersionModel [
	
	versionModel
		state: false;
		label: 'Version';
		action: [ self versionMethod ].
	

]

{ #category : #private }
MethodToolbar >> versionMethod [

	methodHolder contents
		ifNotNil: [:aMethod | self model browseVersionsFrom: aMethod ]
]

{ #category : #accessing }
MethodToolbar >> versionModel [

	^ versionModel
]
