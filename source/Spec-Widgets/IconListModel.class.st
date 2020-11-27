"
An IconListModel is a spec model for icon list
"
Class {
	#name : #IconListModel,
	#superclass : #ListComposableModel,
	#instVars : [
		'iconHolder'
	],
	#category : 'Spec-Widgets'
}

{ #category : #specs }
IconListModel class >> defaultSpec [
	<spec>
	^ {#IconListSpec.
	    		#model:. 						#model.
			#getListSizeSelector:. 			#listSize.
			#getListElementSelector:. 		#listElementAt:.
			#getIndexSelector:. 			#getIndex.
			#setIndexSelector:. 			#setIndex:.
			#getSelectionListSelector:.		#getSelectionStateFor:.
			#setSelectionListSelector:.		#setSelectionStateFor:at:.
			#getIconSelector:.				#getIconFor:.
			#resetListSelector:.				#resetListSelection.
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
IconListModel class >> example [

	self new
		icons: [:e | UITheme current forwardIcon ];
		items: (1 to: 10) asArray;
		openWithSpec
]

{ #category : #morphic }
IconListModel >> getIconFor: anItem [

	^ iconHolder contents cull: anItem cull: self
]

{ #category : #protocol }
IconListModel >> icons [
	<api: #inspect>
	"Return the block which takes an item as argument and returns the icon to display in the list"
	
	^ iconHolder contents
]

{ #category : #protocol }
IconListModel >> icons: aBlock [
	<api: #block getter: #icon registration: #whenIconsChanged: >
	"Set a block which takes an item as argument and returns the icon to display in the list"
	iconHolder contents: aBlock
]

{ #category : #initialization }
IconListModel >> initialize [
	"Initialization code for IconListModel"

	super initialize.

	iconHolder := [:item | nil ] asValueHolder.
]

{ #category : #'protocol-events' }
IconListModel >> whenIconsChanged: aBlock [ 
	<api: #block>
	
	iconHolder whenChangedDo: aBlock 


]
