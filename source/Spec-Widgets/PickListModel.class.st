"
A PickList is a tick list done using spec.
"
Class {
	#name : #PickListModel,
	#superclass : #ComposableModel,
	#instVars : [
		'defaultValueHolder',
		'labelClickableHolder',
		'listModel',
		'pickedItemsHolder',
		'wrapHolder',
		'associationsItemToWrapper',
		'associationsWrapperToItem',
		'associationsIndexToWrapper',
		'blockToPerformOnWrappers'
	],
	#category : 'Spec-Widgets-PolyWidgets'
}

{ #category : #specs }
PickListModel class >> defaultSpec [
	<spec>
	
	^ SpecLayout composed 
		add: #listModel;
		yourself
]

{ #category : #example }
PickListModel class >> example [
	"self example"
	| instance |
	
	instance := self new.
	instance openWithSpec.
	instance items: { {1. 2. 4}. 'Foo'. 123}
]

{ #category : #specs }
PickListModel class >> title [

	^ 'Pick List Example'
]

{ #category : #private }
PickListModel >> addPicked: item [

	pickedItemsHolder add: item.
	pickedItemsHolder contentsChanged: true to: item.
]

{ #category : #accessing }
PickListModel >> blockToPerformOnWrappers [

	^ blockToPerformOnWrappers contents
]

{ #category : #accessing }
PickListModel >> blockToPerformOnWrappers: aBlock [

	blockToPerformOnWrappers contents: aBlock
]

{ #category : #protocol }
PickListModel >> checkboxFor: anItem [

	^ associationsItemToWrapper at: anItem ifAbsent: [ nil ]
]

{ #category : #protocol }
PickListModel >> defaultValue [

	^ defaultValueHolder contents
]

{ #category : #protocol }
PickListModel >> defaultValue: aBoolean [

	defaultValueHolder contents: aBoolean
]

{ #category : #protocol }
PickListModel >> displayBlock: aBlock [

	wrapHolder contents: aBlock
]

{ #category : #protocol }
PickListModel >> indexFor: aCheckbox [

	^ listModel listItems indexOf: aCheckbox.
]

{ #category : #initialization }
PickListModel >> initialize [
	"Initialization code for PickList"

	wrapHolder := [ :i | i printString ] asValueHolder. 
	pickedItemsHolder := OrderedCollection new asValueHolder.
	associationsWrapperToItem := Dictionary new asValueHolder.
	associationsItemToWrapper := Dictionary new asValueHolder.
	associationsIndexToWrapper := Dictionary new asValueHolder.
	labelClickableHolder := true asValueHolder.
	defaultValueHolder := false asValueHolder.
	blockToPerformOnWrappers := [:wrapper | ] asValueHolder.
	
	super initialize.
]

{ #category : #initialization }
PickListModel >> initializePresenter [
	
	labelClickableHolder whenChangedDo: [:aBoolean | 
		associationsWrapperToItem keys do: [:e | e labelClickable: aBoolean ]].

	defaultValueHolder whenChangedDo: [:value | associationsWrapperToItem keysDo: [:cb | cb state: value ]].
]

{ #category : #initialization }
PickListModel >> initializeWidgets [
	
	self instantiateModels: #( listModel ListComposableModel ).
	listModel displayBlock: [ :item | item ].
	self focusOrder add: listModel
]

{ #category : #protocol }
PickListModel >> itemFor: aCheckbox [

	^ associationsWrapperToItem at: aCheckbox ifAbsent: [ nil ]
]

{ #category : #protocol }
PickListModel >> items: aCollection [

	associationsWrapperToItem removeAll.
	pickedItemsHolder removeAll.
	listModel items: (aCollection collectWithIndex: [:e :i | self wrap: e at: i ]).
]

{ #category : #protocol }
PickListModel >> labelClickable [
	
	^ labelClickableHolder contents
]

{ #category : #protocol }
PickListModel >> labelClickable: aBoolean [

	labelClickableHolder contents: aBoolean
]

{ #category : #accessing }
PickListModel >> listModel [

	^ listModel
]

{ #category : #protocol }
PickListModel >> pickedItems [
	"Returns the selected items according to the order they have been picked"
	
	^ pickedItemsHolder contents
]

{ #category : #private }
PickListModel >> removePicked: item [

	pickedItemsHolder remove: item ifAbsent: [ ^ self ].
]

{ #category : #protocol }
PickListModel >> resetSelection [

	listModel resetSelection
]

{ #category : #protocol }
PickListModel >> selectedIndex [

	^ listModel selectedIndex
]

{ #category : #protocol }
PickListModel >> selectedItem [

	^ associationsWrapperToItem 
		at: listModel selectedItem
		ifAbsent: [ nil ]
]

{ #category : #protocol }
PickListModel >> selectedItems [
	"Returns the selected items according to the list order"
	| wrappers items |
	
	wrappers := listModel listItems.
	items := wrappers collect: [:e || value |
		value := associationsWrapperToItem at: e ifAbsent: [ nil ].
		(value isNil or: [ e state not ])
			ifTrue: [ nil ]
			ifFalse: [ value ]] thenSelect: [ :e | e notNil ].
	^ items
]

{ #category : #protocol }
PickListModel >> setSelectedIndex: anIndex [

	listModel setSelectedIndex: anIndex
]

{ #category : #'protocol-events' }
PickListModel >> whenListChanged: aBlock [

	listModel whenListChanged: aBlock
]

{ #category : #'protocol-events' }
PickListModel >> whenPickedItemsChanged: aBlock [

	pickedItemsHolder whenChangedDo: aBlock
]

{ #category : #'protocol-events' }
PickListModel >> whenSelectedItemChanged: aBlock [
	| newBlock |
	
	newBlock := [ :item | aBlock cull: (associationsWrapperToItem at: item ifAbsent: [ nil ])].
	listModel whenSelectedItemChanged: newBlock
]

{ #category : #'protocol-events' }
PickListModel >> whenSelectionChanged: aBlock [

	listModel whenSelectionChanged: aBlock
]

{ #category : #'protocol-events' }
PickListModel >> whenSelectionIndexChanged: aBlock [

	listModel whenSelectionIndexChanged: aBlock
]

{ #category : #private }
PickListModel >> wrap: item at: index [
	| checkBox |

	associationsIndexToWrapper 
		at: index
		ifPresent: [:cb | ^ cb ].

	checkBox := self instantiate: CheckBoxModel.
	blockToPerformOnWrappers contents value: checkBox.
	checkBox label: (wrapHolder contents cull: item cull: self).
	
	checkBox whenActivatedDo: [ 
		self addPicked: item.
		listModel setSelectedItem: checkBox.
		listModel takeKeyboardFocus ].
	
	checkBox whenDesactivatedDo: [ 
		self removePicked: item.
		listModel setSelectedItem: checkBox.
		listModel takeKeyboardFocus ].
	
	checkBox 
		state: self defaultValue;
		labelClickable: self labelClickable.
		
	associationsWrapperToItem at: checkBox put: item.
	associationsItemToWrapper at: item put: checkBox.
	associationsIndexToWrapper at: index put: checkBox.
	^ checkBox
]

{ #category : #accessing }
PickListModel >> wrapHolder [

	^ wrapHolder
]

{ #category : #protocol }
PickListModel >> wrappers [

	^ associationsWrapperToItem keys
]
