"
A ListComposableModel is an applicative model which handle a basic list.

| t |
t:= ListComposableModel new.
t openWithSpec.
t items: (Smalltalk allClasses).


self example

| t |
t:= ListComposableModel new.
t openWithSpec.
t sortingBlock: [:a :b| a name > b name].
t items: (Smalltalk allClasses).


| t |
t:= ListComposableModel new.
t openWithSpec.
t filteringBlock: [:col | col select: [:each | each name beginsWith: 'Zn']].
t sortingBlock: [:a :b| a name > b name].
t items: (Smalltalk allClasses).

"
Class {
	#name : #ListComposableModel,
	#superclass : #AbstractBasicWidget,
	#instVars : [
		'selectionHolder',
		'listHolder',
		'menuHolder',
		'shortcutsHolder',
		'multiSelectionHolder',
		'multiSelection',
		'allowToSelect',
		'listItemsCache',
		'filteringBlockHolder',
		'sortingBlockHolder',
		'wrapBlockHolder',
		'listAnnouncer'
	],
	#category : 'Spec-Widgets'
}

{ #category : #specs }
ListComposableModel class >> defaultSpec [
	<spec: #default>
	^ {#ListSpec.
	    		#model:. 					#model.
			#getListSizeSelector:. 			#listSize.
			#getIndexSelector:. 			#getIndex.
			#setIndexSelector:. 			#setIndex:.
			#getSelectionListSelector:.		#getSelectionStateFor:.
			#setSelectionListSelector:.		#setSelectionStateFor:at:.
			#getListElementSelector:. 		#listElementAt:.
			#resetListSelector:.			#resetListSelection.
			#getMenuSelector:.			#menu:shifted:.
			#setMultipleSelection:.			{#model. #multiSelection}.
			#wrapSelector:. 				#wrapItem:index:.
			#borderWidth:.						#(model borderWidth).
			#borderColor:.						#(model borderColor).
			#setBalloonText:.					{ #model . #help}.
			#hResizing:. 					#spaceFill.
			#vResizing:. 					#spaceFill}
]

{ #category : #example }
ListComposableModel class >> example [
	| instance |

	instance := self new.
	instance openWithSpec.
	instance items: (Smalltalk allClasses).
]

{ #category : #specs }
ListComposableModel class >> title [

	^ 'List'
]

{ #category : #protocol }
ListComposableModel >> allowToSelect [
	<api: #inspect>
	"Return whether the list items can be selected or not"

	^ allowToSelect contents
]

{ #category : #protocol }
ListComposableModel >> allowToSelect: aBoolean [
	<api: #boolean getter: #allowToSelect registration: #whenAllowToSelectChanged:>
	"Set if the list items can be selected or not"

	allowToSelect contents: aBoolean.
	aBoolean 
		ifFalse: [ self resetSelection ].
]

{ #category : #protocol }
ListComposableModel >> beMultipleSelection [
	<api: #do>
	"Make list selection multiple"

	self multiSelection: true
]

{ #category : #protocol }
ListComposableModel >> beSingleSelection [
	<api: #do>
	"Make list selection single"

	self multiSelection: false
]

{ #category : #private }
ListComposableModel >> clickOnSelectedItem [
	| item |
	
	item := self selectedItem.
	^ (item notNil and: [ item respondsTo: #click ])
		ifTrue: [ ^ item click ]
]

{ #category : #initialize }
ListComposableModel >> defaultFilteringBlock [ 
	^ [:col | col]
]

{ #category : #initialize }
ListComposableModel >> defaultSortingBlock [ 
	^ [:a :b | true]
]

{ #category : #protocol }
ListComposableModel >> displayBlock [
	<api: #inspect>
	"Return the one argument block used to wrap your domain specific items.
	The block should return something that can be displayed in a list - like a String or a Text"
	
	^ wrapBlockHolder contents
]

{ #category : #protocol }
ListComposableModel >> displayBlock: aBlock [
	<api: #block getter:#displayBlock registration: #whenDisplayBlockChanged:>
	"Set the one argument block used to wrap your domain specific items.
	The block should return something that can be displayed in a list - like a String or a Text"
	
	wrapBlockHolder contents: aBlock
]

{ #category : #focus }
ListComposableModel >> eventKeyStrokeForNextFocus [
	"String describing the keystroke to perform to jump to the next widget"	
	^ Character arrowRight asShortcut
]

{ #category : #focus }
ListComposableModel >> eventKeyStrokeForPreviousFocus [
	"String describing the keystroke to perform to jump to the previous widget"
	^ Character arrowLeft asShortcut
]

{ #category : #protocol }
ListComposableModel >> filteringBlock [
	<api: #inspect>
	"Return the filtering of the items"
	
	^ filteringBlockHolder contents
]

{ #category : #protocol }
ListComposableModel >> filteringBlock: aBlock [
	<api: #block getter: #filteringBlock registration: #whenFilteringBlockChanged:>
	"To set the filtering of the items"
	
	filteringBlockHolder contents: aBlock
]

{ #category : #'private-morphic' }
ListComposableModel >> getIndex [
	"Morphic API - The method should only be used internally for the communication between the model and the morphic widget" 
	"Return the index of the selected item"
	
	^  selectionHolder index contents
]

{ #category : #'private-morphic' }
ListComposableModel >> getSelectionStateFor: anIndex [
	"Morphic API - The method should only be used internally for the communication between the model and the morphic widget" 
	"Return the current state of the item -if selected or not - iun a multiple selection list"
	"Answer true if the item at index _anIndex_ is selected"
	
	^ (multiSelectionHolder at: anIndex ifAbsent: [ ^ false ]) == true
]

{ #category : #initialize }
ListComposableModel >> initialize [
	super initialize.
	
	selectionHolder := SelectionValueHolder new.
	listHolder := Array new asValueHolder.
	sortingBlockHolder := self defaultSortingBlock asValueHolder.
	filteringBlockHolder := self defaultFilteringBlock asValueHolder.
	wrapBlockHolder := [ :object | object asStringOrText ] asValueHolder.
	menuHolder := [ :menu :shifted | nil ] asValueHolder.
	multiSelectionHolder := IdentityDictionary new asValueHolder.
	multiSelection := false asValueHolder.
	allowToSelect := true asValueHolder.
	listAnnouncer := Announcer new.
	self registerEvents.

	self
		on: Character space asShortcut
		do: [ self clickOnSelectedItem ]
]

{ #category : #protocol }
ListComposableModel >> items: aList [
	"Set the items of the list.
	aList is a collection of your domain specific items.
	Use a two stages notification (issue 7420)."

	<api: #st getter: #listItems registration: #whenListChanged:>
	| oldContents |
	oldContents := listHolder contents.
	listHolder contents: (aList sorted: sortingBlockHolder contents).
	listAnnouncer announce: (ValueChanged oldContents: oldContents newContents: listHolder contents)
]

{ #category : #'private-morphic' }
ListComposableModel >> listElementAt: anIndex [
	"Morphic API - The method should only be used internally for the communication between the model and the morphic widget" 
	"Return the item at index _anIndex_"
	
	^ self listItems at: anIndex ifAbsent: [ nil ]
]

{ #category : #'private-morphic' }
ListComposableModel >> listElementAt: anIndex ifAbsent: aBlock [
	"Morphic API - The method should only be used internally for the communication between the model and the morphic widget" 
	"Return the item at index _anIndex_"
	
	^ self listItems at: anIndex ifAbsent: aBlock
]

{ #category : #protocol }
ListComposableModel >> listItems [
	<api: #inspect>
	"Return the items of the list. They are your domain specific items"
	
	^ listItemsCache ifNil: [ listItemsCache :=  filteringBlockHolder contents value: listHolder contents ]
	
]

{ #category : #protocol }
ListComposableModel >> listSize [
	<api: #inspect>
	"Return the size of the list"
	
	^ self listItems size
]

{ #category : #protocol }
ListComposableModel >> menu [
	<api: #inspect>
	"Return the block used to defined the menu"
	
	^ menuHolder contents
]

{ #category : #protocol }
ListComposableModel >> menu: aBlock [
	<api: #block getter: #menu registration: #whenMenuChanged:>
	"Set the block used to defined the menu"
	
	menuHolder contents: aBlock
]

{ #category : #'private-morphic' }
ListComposableModel >> menu: aMenu shifted: aBoolean [
	"Morphic API - The method should only be used internally for the communication between the model and the morphic widget" 
	"Build the menu when you right click on an item"

	^ menuHolder contents cull: aMenu cull: aBoolean
]

{ #category : #protocol }
ListComposableModel >> multiSelection [
	<api: #inspect>
	"Return true if the list has a multiple selection.
	False if the list has a single selection"
	
	^ multiSelection contents
]

{ #category : #protocol }
ListComposableModel >> multiSelection: aBoolean [
	<api: #boolean getter: #multiSelection registration: #whenMultiSelectionChanged:>
	"Make the list seelction become multiple if aBoolean is true.
	Otherwise set the selection as single"
	
	multiSelection contents: aBoolean.
	
]

{ #category : #private }
ListComposableModel >> refreshListItems [

	listItemsCache := nil.
	^ self changed: #listElementAt:
]

{ #category : #initialize }
ListComposableModel >> registerEvents [

	listHolder whenChangedDo: [ self refreshListItems ].
	filteringBlockHolder whenChangedDo: [ self refreshListItems ].
	selectionHolder index whenChangedDo: [ self changed: #getIndex ].
	multiSelection whenChangedDo: [ :b | self widget ifNotNil: [:w | w setMultipleSelection: b ] ].
	wrapBlockHolder whenChangedDo:[ self changed: #listElementAt: ].
	sortingBlockHolder
		whenChangedDo: [ 
			listHolder contents: (listHolder contents sorted: sortingBlockHolder contents).
			self changed: #listElementAt: ].

]

{ #category : #protocol }
ListComposableModel >> resetFilteringBlock [
	<api: #do>
	"Reset the filtering block with the default value which consists in showing everything"

	filteringBlockHolder contents: self defaultFilteringBlock
]

{ #category : #'private-morphic' }
ListComposableModel >> resetListSelection [
	"Morphic API - The method should only be used internally for the communication between the model and the morphic widget" 
	"Reset the selection manager for multiple selection lists"
	
	multiSelectionHolder removeAll
]

{ #category : #protocol }
ListComposableModel >> resetSelection [
	<api: #do>
	"Unselect every items"

	selectionHolder reset.
	multiSelectionHolder removeAll
]

{ #category : #protocol }
ListComposableModel >> resetSortingBlock [
	<api: #do>
	"Reset the sortering block with the default value which consists in not sorting"

	sortingBlockHolder contents: self defaultSortingBlock
]

{ #category : #protocol }
ListComposableModel >> selectedIndex [
	<api: #inspect>
	"Return the index of the selected item
	In the case of a multiple selection list, it returns the last selected item"

	^ self getIndex
]

{ #category : #protocol }
ListComposableModel >> selectedIndexes [
	<api: #inspect>
	"Return the indexes of selected items on the case of a multiple selection list"
	
	^ multiSelectionHolder keys select: [:index | multiSelectionHolder at: index ]
]

{ #category : #protocol }
ListComposableModel >> selectedItem [
	<api: #inspect>
	"Return the selected item.
	In the case of a multiple selection list, it returns the last selected item"
	
	^ self selectedItemHolder contents
]

{ #category : #private }
ListComposableModel >> selectedItemHolder [

	^ selectionHolder selection
]

{ #category : #protocol }
ListComposableModel >> selectedItems [
	<api: #inspect>
	"Return all the selected items in the case of a multiple selection list"

	^ multiSelectionHolder keys select: [:index | multiSelectionHolder at: index ] thenCollect: [:index | self listElementAt: index ]
]

{ #category : #'private-morphic' }
ListComposableModel >> setIndex: anIndex [
	"Morphic API - The method should only be used internally for the communication between the model and the morphic widget" 
	"Set the index of the selected item when you click on an item"

	self allowToSelect ifFalse: [ ^ self ].
	self okToChange ifFalse: [ ^ self ].
	selectionHolder index contents: anIndex.
	selectionHolder selection contents: (self listElementAt: anIndex).
]

{ #category : #protocol }
ListComposableModel >> setSelectedIndex: anIndex [
	<api: #integer min: 0 max: #listSize getter: #selectedIndex registration: #whenSelectionIndexChanged:>
	"Set the index of the item you want to be selected"
	| idx selection |
	
	self allowToSelect ifFalse: [ ^ self ].
	self okToChange ifFalse: [ ^ self ].
	
	idx := anIndex min: self listSize.
	selection := self 
					listElementAt: idx 
					ifAbsent: [ idx := 0.
								nil ].

	selectionHolder index contents: idx.
	selectionHolder selection contents: selection.
]

{ #category : #protocol }
ListComposableModel >> setSelectedItem: anItem [
	<api: #st getter: #selectedItem registration: #whenSelectedItemChanged:>
	"Set the item you want to be selected"
	| index |

	self okToChange ifFalse: [ ^ self ].
	index := self listItems identityIndexOf: anItem ifAbsent: [ ^ self ].
	selectionHolder index contents: index.
	selectionHolder selection contents: anItem
]

{ #category : #'private-morphic' }
ListComposableModel >> setSelectionStateFor: anIndex at: aBoolean [
	"Morphic API - The method should only be used internally for the communication between the model and the morphic widget" 
	"Set the selection state of the item at index _anIndex_ in the case of multiple selection list"

	self allowToSelect ifFalse: [ ^ self ].
	^ multiSelectionHolder at: anIndex put: aBoolean
]

{ #category : #protocol }
ListComposableModel >> sortingBlock [
	<api: #inspect>
	"Return the ordering of the items"
	
	^ sortingBlockHolder contents
]

{ #category : #protocol }
ListComposableModel >> sortingBlock: aBlock [
	<api: #block getter: #sortingBlock registration: #whenSortingBlockChanged:>
	"To set the ordering of the items"
	
	sortingBlockHolder contents: aBlock
]

{ #category : #protocol }
ListComposableModel >> updateList [
	<api: #do>
	"Refresh the list"
	
	self changed: #listElementAt:.
	self resetSelection
]

{ #category : #'protocol-events' }
ListComposableModel >> whenAllowToSelectChanged: aBlock [
	<api: #event>
	"Set a block to value when the value of allowToSelect has changed"
	
	allowToSelect whenChangedDo: aBlock
]

{ #category : #'protocol-events' }
ListComposableModel >> whenDisplayBlockChanged: aBlock [
	<api: #event>
	"Set a block to value when the filtering block block has changed"
	
	wrapBlockHolder whenChangedDo: aBlock
]

{ #category : #'protocol-events' }
ListComposableModel >> whenFilteringBlockChanged: aBlock [
	<api: #event>
	"Set a block to value when the filtering block block has changed"
	
	filteringBlockHolder whenChangedDo: aBlock
]

{ #category : #'protocol-events' }
ListComposableModel >> whenListChanged: aBlock [
	"Specify a block to value after the contents of the list has changed"

	"Basically when you set a new list of items"

	<api: #event>
	| block |
	block := [ :announcement :ann | 
	aBlock
		cull: announcement newContents
		cull: announcement oldContents
		cull: announcement
		cull: ann ].
	listAnnouncer weak
		on: ValueChanged
		do: block
]

{ #category : #'protocol-events' }
ListComposableModel >> whenMenuChanged: aBlock [
	<api: #event>
	"Set a block to value when the menu block has changed"
	
	menuHolder whenChangedDo: aBlock
]

{ #category : #'protocol-events' }
ListComposableModel >> whenMultiSelectionChanged: aBlock [
	<api: #event>
	"Set a block to value when the multiSelection value has changed"
	
	multiSelection whenChangedDo: aBlock
]

{ #category : #'protocol-events' }
ListComposableModel >> whenSelectedItemChanged: aBlock [
	<api: #event>
	"Set a block to value when the select item is changed"
	
	selectionHolder selection whenChangedDo: aBlock
]

{ #category : #'protocol-events' }
ListComposableModel >> whenSelectionChanged: aBlock [
	<api: #event>
	"Set a block to value when the selection of the list has changed"

	selectionHolder whenChangedDo: aBlock.
	multiSelectionHolder whenChangedDo: aBlock.
]

{ #category : #'protocol-events' }
ListComposableModel >> whenSelectionIndexChanged: aBlock [
	<api: #event>
	"Set a block to value when the selection index has changed"
	
	selectionHolder index whenChangedDo: aBlock
]

{ #category : #'protocol-events' }
ListComposableModel >> whenSortingBlockChanged: aBlock [
	<api: #event>
	"Set a block to value when the sorting block has changed"
	
	sortingBlockHolder whenChangedDo: aBlock
]

{ #category : #'private-morphic' }
ListComposableModel >> wrapItem: anObject index: index [
	"Morphic API - The method should only be used internally for the communication between the model and the morphic widget" 
	"Return the item _anObject_ wrapped"

	^ wrapBlockHolder contents cull: anObject cull: index
]
