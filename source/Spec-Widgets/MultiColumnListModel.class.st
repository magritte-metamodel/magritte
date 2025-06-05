"
A MultiColumnListModel is a spec model for Multi columns list
"
Class {
	#name : 'MultiColumnListModel',
	#superclass : 'ListComposableModel',
	#category : 'Spec-Widgets'
}

{ #category : 'specs' }
MultiColumnListModel class >> defaultSpec [
	<spec>
	^ {#MultiColumnListSpec.
			#wrapSelector:. 				#wrapItem:index:.
	    		#model:. 						#model.
			#getListSizeSelector:. 			#listSize.
			#getIndexSelector:. 			#getIndex.
			#setIndexSelector:. 			#setIndex:.
			#getSelectionListSelector:.		#getSelectionStateFor:.
			#setSelectionListSelector:.		#setSelectionStateFor:at:.
			#getListElementSelector:. 		#listElementAt:.
			#resetListSelector:.				#resetListSelection.
			#getMenuSelector:.			#menu:shifted:.
			#setMultipleSelection:.			{#model. #multiSelection}.
			#borderWidth:.						#(model borderWidth).
			#borderColor:.						#(model borderColor).
			#setBalloonText:.					{ #model . #help}.
			#hResizing:. 					#spaceFill.
			#vResizing:. 					#spaceFill}
]

{ #category : 'remove me' }
MultiColumnListModel >> getIndex [

	^ selectionHolder index contents
]

{ #category : 'morphic' }
MultiColumnListModel >> listElementAt: anIndex [

	^ self wrapItem: (self listItems at: anIndex) index: anIndex 
]

{ #category : 'morphic' }
MultiColumnListModel >> setIndex: anIndex [

	self allowToSelect ifFalse: [ ^ self ].
	self okToChange ifFalse: [ ^ self ].
	selectionHolder index contents: anIndex.
	selectionHolder selection contents: (self listItems at: anIndex ifAbsent: [ nil ]).
]

{ #category : 'protocol' }
MultiColumnListModel >> setSelectedIndex: anIndex [
	<api: #integer min: 0 max: #listSize getter: #selectedIndex registration: #whenSelectionIndexChanged:>
	"Set the index of the item you want to be selected"
	| idx selection |
	
	self allowToSelect ifFalse: [ ^ self ].
	self okToChange ifFalse: [ ^ self ].
	self listSize isZero ifTrue:  [ ^self ].
	idx := anIndex min: self listSize.
	selection := self listItems 
					at: idx 
					ifAbsent: [ idx := 0.
								nil ].
	
	selectionHolder index contents: idx.
	selectionHolder selection contents: selection.
]
