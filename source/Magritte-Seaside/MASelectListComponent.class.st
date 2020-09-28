"
I display a simple list to allow the user to choose one element from the list. I am one of the two seaside components to render MASingleSelectionDescription.
"
Class {
	#name : #MASelectListComponent,
	#superclass : #MASingleSelectionComponent,
	#category : 'Magritte-Seaside-Components'
}

{ #category : #testing }
MASelectListComponent class >> isAbstract [
	^ false
]

{ #category : #'accessing-model' }
MASelectListComponent >> groups [
	"The options objects are assumed to understand the 'groupBy' selector supplied by the description object. Keep the global ordering intact."

	| groups group |
	groups := OrderedCollection new.
	self options do: [ :option | 
		option isNil ifFalse: [
			group := self magritteDescription groupBy read: option.
			(groups
				detect: [ :each | each key = group ]
				ifNone: [ groups addLast: group -> OrderedCollection new ])
					value addLast: option ] ].
	^ groups
]

{ #category : #testing }
MASelectListComponent >> hasLabelId [
	^ self isReadonly not
]

{ #category : #'rendering-grouped' }
MASelectListComponent >> renderEditorForGroupedOn: html [ 
	html select 
		id: self labelId;
		dispatchCallback;
		with: [ self renderGroupsOn: html ]
]

{ #category : #rendering }
MASelectListComponent >> renderEditorForUngroupedOn: html [
	html select
		id: self labelId;
		list: self options;
		selected: self value;
		callback: [ :value | self value: value ];
		labels: [ :value | self labelForOption: value ]
]

{ #category : #rendering }
MASelectListComponent >> renderEditorOn: html [
	(self magritteDescription isGrouped and: [ self magritteDescription groupBy canRead: self value ])
		ifTrue: [ self renderEditorForGroupedOn: html ]
		ifFalse: [ self renderEditorForUngroupedOn: html ]

]

{ #category : #'rendering-grouped' }
MASelectListComponent >> renderGroupsOn: html [
	^ self groups do: [ :association |
		html optionGroup
			label: association key;
			with: [ 
				association value
					do: [ :option | self renderOption: option on: html ] ] ]
]

{ #category : #'rendering-grouped' }
MASelectListComponent >> renderOption: option on: html [
	^ html option
		selected: self value = option;
		callback: [ self value: option ];
		with: (self labelForOption: option)
]
