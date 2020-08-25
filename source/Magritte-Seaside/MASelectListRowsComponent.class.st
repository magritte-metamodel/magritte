"
I am similar to MASelectListComponent, but rather than displaying the options in a drop-down I display the options in a list.
"
Class {
	#name : #MASelectListRowsComponent,
	#superclass : #MASelectListComponent,
	#category : 'Magritte-Seaside-Components'
}

{ #category : #private }
MASelectListRowsComponent >> itemsDisplayed [
	^ (self options size min: self maxItemsDisplayed) max: 5
	
]

{ #category : #private }
MASelectListRowsComponent >> maxItemsDisplayed [
	^ self magritteDescription propertyAt: #maxItemsDisplayed ifAbsent: [ 10 ]
	
]

{ #category : #'rendering-grouped' }
MASelectListRowsComponent >> renderEditorForGroupedOn: html [ 
	html select 
		id: self labelId;
		dispatchCallback;
		size: self itemsDisplayed;
		with: [ self renderGroupsOn: html ]
]

{ #category : #rendering }
MASelectListRowsComponent >> renderEditorForUngroupedOn: html [
	html select
		id: self labelId;
		list: self options;
		size: self itemsDisplayed;
		selected: self value;
		callback: [ :value | self value: value ];
		labels: [ :value | self labelForOption: value ]
]
