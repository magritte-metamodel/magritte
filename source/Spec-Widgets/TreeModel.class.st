"
A TreeModel is a spec model of a Tree ;)
"
Class {
	#name : 'TreeModel',
	#superclass : 'AbstractBasicWidget',
	#instVars : [
		'childrenBlockHolder',
		'rootsHolder',
		'selectionHolder',
		'menuBlockHolder',
		'wrapBlockHolder'
	],
	#category : 'Spec-Widgets'
}

{ #category : 'specs' }
TreeModel class >> defaultSpec [
	<spec>
	
	^ {#TreeSpec.
	    		#model:.							#model.
			#getLabelSelector:.				#wrapItem:.
			#getRootsSelector:.				#getRoots.
			#getChildrenSelector:.				#getChildrenFor:.
			#setSelectedSelector:.			#setSelectedItem:.
			#color:.							Color white.
			#getMenuSelector:.				#getMenu:.
			#hResizing:. 						#spaceFill.
			#setBalloonText:.					{ #model . #help}.
			#borderColor:.						#(model borderColor).
			#borderWidth:.						#(model borderWidth).
			#vResizing:. 						#spaceFill.}
]

{ #category : 'example' }
TreeModel class >> example [
	| m |

	m := TreeModel new.
	m openWithSpec.
	m roots: #(a b c d).
	m childrenBlock: [:it | it = #c 
							ifTrue: [ {1. 2. 3} ]
							ifFalse: [ {} ]].
	m displayBlock: [:item | item isSymbol
								ifTrue: [ item, ' symbol' ]
								ifFalse: [ item printString ]].
]

{ #category : 'specs' }
TreeModel class >> title [

	^ 'Tree'
]

{ #category : 'protocol' }
TreeModel >> childrenBlock [
	< api: #inspect>
	"Return the block used to retrieve the children of a node.
	The optional block arguments are:
		- the node
		- the tree"

	^ childrenBlockHolder contents
]

{ #category : 'protocol' }
TreeModel >> childrenBlock: aBlock [
	< api: #block getter: #childrenBlock registration: #whenChildrenBlockChanged:>
	"Set the block used to retrieve the children of a node.
	The optional block arguments are:
		- the node
		- the tree"

	childrenBlockHolder contents: aBlock
]

{ #category : 'protocol' }
TreeModel >> displayBlock [
	< api: #inspect>
	"Return the block used to generate the display of the items.
	The optioanl block arguments are:
		- the item
		- the tree"

	^ wrapBlockHolder contents
]

{ #category : 'protocol' }
TreeModel >> displayBlock: aBlock [
	< api: #block getter: #displayBlock registration: #whenDisplayBlockChanged:>
	"Set the block used to generate the display of the items.
	The optioanl block arguments are:
		- the item
		- the tree"

	wrapBlockHolder contents: aBlock
]

{ #category : 'focus' }
TreeModel >> eventKeyStrokeForNextFocus [
	"String describing the keystroke to perform to jump to the next widget"
	^ Character arrowRight asShortcut
]

{ #category : 'focus' }
TreeModel >> eventKeyStrokeForPreviousFocus [
	"String describing the keystroke to perform to jump to the previous widget"
	^ Character arrowLeft asShortcut
]

{ #category : 'morphic' }
TreeModel >> getChildrenFor: anItem [

		^ childrenBlockHolder contents cull: anItem cull: self
]

{ #category : 'morphic' }
TreeModel >> getMenu: aMenu [

	menuBlockHolder contents cull: aMenu cull: self.
	^ aMenu
]

{ #category : 'morphic' }
TreeModel >> getRoots [
							
	^ rootsHolder contents
]

{ #category : 'initialization' }
TreeModel >> initialize [
	"Initialization code for TreeModel"

	super initialize.

	childrenBlockHolder := [ {} ] asValueHolder.
	rootsHolder := {} asValueHolder.
	selectionHolder := nil asValueHolder.
	menuBlockHolder := [] asValueHolder.
	wrapBlockHolder := [:item | item printString ] asValueHolder.

	self registerEvents
]

{ #category : 'protocol' }
TreeModel >> menu [
	<api: #inspect>
	"Return the block used to generate the tree menu"

	^ menuBlockHolder contents
]

{ #category : 'protocol' }
TreeModel >> menu: aBlock [
	< api: #block getter: #menu registration: #whenMenuChanged:>
	"Set the block used to generate the tree menu"

	menuBlockHolder contents: aBlock
]

{ #category : 'initialization' }
TreeModel >> registerEvents [

	rootsHolder whenChangedDo: [ self changed: #getRoots ].
	childrenBlockHolder whenChangedDo: [ self changed: #getRoots ].
	wrapBlockHolder whenChangedDo: [ self changed: #getRoots ].
]

{ #category : 'protocol' }
TreeModel >> roots [
	< api: #inspect>
	"Return the tree roots"

	^ rootsHolder contents
]

{ #category : 'protocol' }
TreeModel >> roots: aCollection [
	< api: #st getter: #roots registration: #whenRootsChanged:>
	"Set the tree roots"

	rootsHolder contents: aCollection
]

{ #category : 'protocol' }
TreeModel >> selectedItem [
	< api: #inspect>
	"Return the selected item"
	"In the case of a multiple selection list, it returns the last selected item"
	
	^ selectionHolder contents
]

{ #category : 'protocol' }
TreeModel >> selectedItem: anItem [
	< api: #st getter: #selectedItem registration: #whenSelectedItemChanged:>
	"Set the selected item"
	"In the case of a multiple selection list, it returns the last selected item"
	
	selectionHolder contents: anItem
]

{ #category : 'morphic' }
TreeModel >> setSelectedItem: anItem [

	selectionHolder contents: anItem.
]

{ #category : 'protocol' }
TreeModel >> updateTree [
	< api: #do>
	"Force the tree to refresh"

	self changed: #getRoots
]

{ #category : 'protocol-events' }
TreeModel >> whenChildrenBlockChanged: aBlock [
	"Set a block to perform when a new childrenBlock is set"

	childrenBlockHolder whenChangedDo: aBlock
]

{ #category : 'protocol-events' }
TreeModel >> whenDisplayBlockChanged: aBlock [
	"Set a block to perform when a new displayBlock is set"

	wrapBlockHolder whenChangedDo: aBlock
]

{ #category : 'protocol-events' }
TreeModel >> whenMenuChanged: aBlock [
	"Set a block to perform when a new menuBlock is set"

	menuBlockHolder whenChangedDo: aBlock
]

{ #category : 'protocol-events' }
TreeModel >> whenSelectedItemChanged: aBlock [
	"Set a block to perform when a new item is selected"

	selectionHolder whenChangedDo: aBlock
]

{ #category : 'morphic' }
TreeModel >> wrapItem: anItem [

	^ wrapBlockHolder contents cull: anItem cull: self
]
