"
I build a form for an object described by an {{gtClass:MAContainer}} whose children are  {{gtClass:MACompositeAccessor}}s. Here's an example: {{gtExample:MACompositeElementBuilder class>>#example}}

See {{gtClass:MACompositeAccessor}} for more info.
"
Class {
	#name : #MACompositeElementBuilder,
	#superclass : #MAElementBuilder,
	#category : #'Magritte-GToolkit'
}

{ #category : #accessing }
MACompositeElementBuilder class >> example [
	<gtExample>
	^ self new
		object: { #people -> { 
			MAContainer samplePersonHarryPotter.
			MAContainer samplePersonDumbledore } } asDictionary;
		objectDescription: MACompositeAccessor sampleContainer;
		addButtons;
		element
]

{ #category : #accessing }
MACompositeElementBuilder >> visitSingleOptionDescription: aDescription [
	| inputElement items |
	self flag: 'lots of duplication with super implementation'.
	items := aDescription allOptions copyWith: MACompositeConflict new; yourself.
	inputElement := MADropdownElement new 
		items: items;
		itemDescription: aDescription reference;
		selection: (aDescription read: self memento);
		when: MADropdownWish do: [ :aWish | 
			aWish selection = MACompositeConflict new ifFalse: [ aDescription write: aWish selection to: self memento ] ];
		yourself.
	self addInputField: inputElement using: aDescription
]
