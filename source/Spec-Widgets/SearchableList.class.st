"
SearchableList 
	new items: #( aaa abc axz bbb bfbg bof c);
	openWithSpec
	
should it be a subclass of LIstModel?
Because now I will have to delegate a lot? and I cannot plug a IconList

How do I make textModel react to every keystroke without an accept
"
Class {
	#name : #SearchableList,
	#superclass : #ComposableModel,
	#instVars : [
		'listModel',
		'searchModel'
	],
	#category : 'Spec-Widgets-PolyWidgets'
}

{ #category : #specs }
SearchableList class >> defaultSpec [

	^ {#ComposableSpec .
		#add: . {{#model . #searchModel.}. #layout: . #(FrameLayout
															bottomFraction: 0
															bottomOffset: 25) } .
		#add: . {{#model . #listModel.}. #layout: . #(FrameLayout
															topOffset: 25) }}
]

{ #category : #initialize }
SearchableList >> initializePresenter [

	searchModel whenTextChanged: [:newText || text |
		text :=  searchModel getText asLowercase.
		text isEmpty
			ifTrue: [ listModel resetFilteringBlock ]
			ifFalse: [
				listModel filteringBlock: [:col | col select: [:e | e asLowercase beginsWith: searchModel getText asLowercase ]]]]
]

{ #category : #initialize }
SearchableList >> initializeWidgets [

	self instantiateModels: #(	
		listModel 		ListComposableModel
		searchModel 	TextInputFieldModel ).
	searchModel 
		autoAccept: true;
		ghostText: 'filter'.
]

{ #category : #accessing }
SearchableList >> listModel [
	^ listModel
]

{ #category : #accessing }
SearchableList >> searchModel [
	^ searchModel
]
