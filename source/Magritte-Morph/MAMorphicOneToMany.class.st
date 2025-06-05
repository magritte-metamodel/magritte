Class {
	#name : 'MAMorphicOneToMany',
	#superclass : 'MAMorphicRelation',
	#category : 'Magritte-Morph-Model'
}

{ #category : 'actions' }
MAMorphicOneToMany >> add [

	self newRelation asMagritteMorph
		onAnswer: [ :result |
			result isNil ifFalse: [ self value: (self value copyWith: result) ].
			self add: result ];
		addButtons; 
		addWindow;
		openInWorld
]

{ #category : 'private' }
MAMorphicOneToMany >> add: anObject [
	| rowParent lastRowIndex newRow |
	rowParent := morph submorphs second.
	newRow := MAElementRow for: anObject of: self.
	lastRowIndex := rowParent submorphs findLast: [ :e | e isKindOf: MAElementRow ].
	lastRowIndex = 0 
		ifTrue: [ rowParent addMorph: newRow ]
		ifFalse: [ rowParent 
			addMorph: newRow 
			after: (rowParent submorphs at: lastRowIndex) ].
]

{ #category : 'private' }
MAMorphicOneToMany >> buildMorphView [

	| table scrollPane |
	table := self rectangleMorph
		         listDirection: #topToBottom;
		         yourself.
	self value ifNotNil: [ :v |
		v do: [ :e | MAElementRow addMorphFor: e of: self to: table ] ].
	self magritteDescription isDefinitive ifFalse: [
		self addSelectListTo: table ].
	table computeBounds. "Layout so we know the height, which is needed below"
	scrollPane := (UIManager default newScrollPaneFor: table)
		              changeScrollerTableLayout;
		              hResizing: #shrinkWrap;
		              yourself.
	scrollPane height: (table height min: 200).
	^ scrollPane
]

{ #category : 'private' }
MAMorphicOneToMany >> buildSelectButton [
	^ self theme builder
		newButtonFor: self
		action: #add
		label: 'Add'
		help: ''
]

{ #category : 'private' }
MAMorphicOneToMany >> remove: anObject [
	self value: (self value copyWithout: anObject).
]
