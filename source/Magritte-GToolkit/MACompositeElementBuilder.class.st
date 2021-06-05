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
			self samplePersonHarryPotter.
			self samplePersonDumbledore } } asDictionary;
		objectDescription: self sampleDescription;
		addButtons;
		element
]

{ #category : #'example support' }
MACompositeElementBuilder class >> sampleDescription [
	| desc |
	desc := super sampleDescription
		blocClass: MACompositeElementBuilder;
		yourself.
	desc children do: [ :e | 
		| acc prefixAccessor |
		prefixAccessor := MADictionaryAccessor key: #people.
		acc := MACompositeAccessor via: prefixAccessor using: e ].
	^ desc
]

{ #category : #'example support' }
MACompositeElementBuilder class >> samplePersonDumbledor [
	^ {
			#name ->'Albus Percival Wulfric Brian Dumbledore'.
			#birthplace -> 'Godric''s Hollow' } asDictionary
]

{ #category : #'example support' }
MACompositeElementBuilder class >> samplePersonDumbledore [
	^ {
			#name ->'Albus Percival Wulfric Brian Dumbledore'.
			#birthplace -> 'Godric''s Hollow' } asDictionary
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
