"
A DropListModel is a Spec model for drop lists.

I am assume there is a little problem on an empty list, but frankly, who creates an empty drop list ?

See DropListExample for an example
"
Class {
	#name : 'DropListModel',
	#superclass : 'AbstractBasicWidget',
	#instVars : [
		'listHolder',
		'selectionHolder'
	],
	#category : 'Spec-Widgets'
}

{ #category : 'specs' }
DropListModel class >> defaultSpec [
	<spec>
	
	^ {#DropListSpec.
	    		#on:list:selected:changeSelected:. 	#model. #getList. #getIndex. #setIndex:.
			#hResizing:. 						#spaceFill.
			#vResizing:. 						#spaceFill.
			#borderWidth:.						#(model borderWidth).
			#borderColor:.						#(model borderColor).
			#setBalloonText:.					{ #model . #help}}
]

{ #category : 'specs' }
DropListModel class >> title [

	^ 'Drop List'
]

{ #category : 'protocol' }
DropListModel >> addItemLabeled: aString do: aBlock [

	| item |
	item := DropListItem named: aString do: aBlock.
	
	"If you add directly in the contents, the update is not triggered from the value holder"
	listHolder add: item.
]

{ #category : 'protocol' }
DropListModel >> displayBlock: aBlock [
	
	listHolder replace: [ :e | e display: aBlock; yourself  ].
]

{ #category : 'focus' }
DropListModel >> eventKeyStrokeForNextFocus [
	"String describing the keystroke to perform to jump to the next widget"
	^ Character arrowRight asShortcut
]

{ #category : 'focus' }
DropListModel >> eventKeyStrokeForPreviousFocus [
	"String describing the keystroke to perform to jump to the previous widget"
	^ Character arrowLeft asShortcut
]

{ #category : 'morphic' }
DropListModel >> getIndex [

	^ selectionHolder index contents
]

{ #category : 'morphic' }
DropListModel >> getList [

	^ listHolder contents collect: #label
]

{ #category : 'initialization' }
DropListModel >> initialize [
	"Initialization code for DropListModel"

	super initialize.

	listHolder := OrderedCollection new asValueHolder.
	selectionHolder := SelectionValueHolder new.
	
	listHolder whenChangedDo: [ 
					self changed: #getList.
					self internalResetSelection. ].
				
	selectionHolder whenChangedDo: [ self changed: #getIndex ].
	self whenSelectedItemChanged: [:item | item value ]
]

{ #category : 'private' }
DropListModel >> internalResetSelection [

	selectionHolder reset.
	self getList isEmpty not
		ifTrue: [ self silentlySetSelectedIndex: 1 ]
]

{ #category : 'protocol' }
DropListModel >> items: aList [
	<api: #st getter: #listItems>
	"Populate the drop list with a list of DropItems"
	
	| dropListItems |
	dropListItems := aList collect: [ :e | DropListItem on: e do: [] ].
	listHolder contents: dropListItems
]

{ #category : 'protocol' }
DropListModel >> listItems [
	<api: #inspect>
	"Return the list used to populate the drop list"
	
	^ listHolder contents collect: [ :e | e model ].
]

{ #category : 'protocol' }
DropListModel >> listSize [
	<api: #inspect>
	"Return the size of the list of choices"

	^ self listItems size
]

{ #category : 'protocol' }
DropListModel >> resetSelection [
	<api: #do>
	"Reset the current selection state"

	selectionHolder reset
]

{ #category : 'protocol' }
DropListModel >> selectedIndex [
	<api: #inspect>
	"Useless method but it provides a better and more consistent API"

	^ self getIndex
]

{ #category : 'private' }
DropListModel >> selectedIndexHolder [

	^ selectionHolder index
]

{ #category : 'protocol' }
DropListModel >> selectedItem [
	<api: #inspect>

	^ self selectedItemHolder contents model
]

{ #category : 'private' }
DropListModel >> selectedItemHolder [

	^ selectionHolder selection
]

{ #category : 'morphic' }
DropListModel >> setIndex: anIndex [
	| item |

	selectionHolder index contents: anIndex.
	item := (listHolder contents at: anIndex ifAbsent: [ nil ]).
	item value.
	selectionHolder selection contents: item.
	self changed: #getIndex
]

{ #category : 'protocol' }
DropListModel >> setSelectedIndex: anIndex [
	<api: #integer min:1 max:#listSize getter: #selectedIndex>
	"Force the selection of the item at index anIndex"
	| selection |

	selection := listHolder contents at: anIndex ifAbsent: [ ^ self ].
	selection value.
	selectionHolder index contents: anIndex.
	selectionHolder selection contents: selection
]

{ #category : 'protocol' }
DropListModel >> setSelectedItem: anItem [
	<api: #st getter: #selectedItem>
	"Force the selection of the item anItem"
	| index realItem |
	
	index := self listItems indexOf: anItem ifAbsent: [ ^ self ].
	realItem := listHolder at: index.
	selectionHolder index contents: index.
	selectionHolder selection contents: realItem.
]

{ #category : 'private' }
DropListModel >> silentlySetSelectedIndex: anIndex [
	"Force the selection of the item at index anIndex"
	| selection |

	selection := listHolder contents at: anIndex ifAbsent: [ ^ self ].
	selectionHolder index contents: anIndex.
	selectionHolder selection contents: selection
]

{ #category : 'protocol-events' }
DropListModel >> whenSelectedItemChanged: aBlock [
	<api: #event>
	"Set a block to perform when the selected item is changed"

	selectionHolder selection whenChangedDo: [ :new :old :announcement :ann | 
		aBlock cull: (new ifNotNil: [ :item | item model ]) cull: old cull: announcement cull: ann ]
]

{ #category : 'protocol-events' }
DropListModel >> whenSelectionChanged: aBlock [
	<api: #event>
	"Set a block to perform when the selection is changed"
	
	"The method should be used only if you are interested in the fact that there was a change, without caring about what has changed
	If you are interested in the items, use whenSelectedItemChanged:
	If you are interested in the index, use whenSelectionIndexChanged:"

	selectionHolder whenChangedDo: aBlock.
]

{ #category : 'protocol-events' }
DropListModel >> whenSelectionIndexChanged: aBlock [
	<api: #event>
	"Set a block to perform when the selected index is changed"

	selectionHolder index whenChangedDo: aBlock
]
