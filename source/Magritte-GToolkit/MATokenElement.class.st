Class {
	#name : #MATokenElement,
	#superclass : #BrButton,
	#instVars : [
		'object',
		'removeAction'
	],
	#category : #'Magritte-GToolkit-Widgets'
}

{ #category : #accessing }
MATokenElement >> initialize [

	| clsListBuilder dropdownHandleBuilder dropdownAptitude tokenActions |
	super initialize.
	
	tokenActions := {
		'Remove' -> [ self removeAction value ]. 
		'Splint' -> []
	}.
	
	clsListBuilder := [ BrSimpleList new
		itemStencil: [
			BrLabel new
				hMatchParent;
				aptitude: BrGlamorousLabelAptitude new;
				padding: (BlInsets all: 5);
				yourself ];
		itemDataBinder: [ :eachElement :eachClass :eachIndex | 
			eachElement userData at: #action put: eachClass value.
			eachElement 
				removeEventHandlersSuchThat: [ :hand | hand class = BlEventHandler ];
				addEventHandlerOn: BlClickEvent
					do: [ :evt |
						(eachElement userData at: #action) value.
						self fireEvent: BrDropdownHideWish new ];
				text: eachClass key ];
		items: (tokenActions sorted: [ :a :b | a key < b key  ]);
		vFitContent; 
		hFitContent; 
		yourself ].
		
	dropdownHandleBuilder := [ 
		BrButton new
			label: self label;
			beSmallSize;
			addEventHandlerOn: BlMouseUpEvent
			do: [ :evt |
				evt secondaryButtonPressed ifTrue: [  
					self fireEvent: BrDropdownHideWish new ] ];
			aptitude:
				BrGlamorousButtonWithLabelAptitude
					- BrGlamorousButtonWithLabelTooltipAptitude
						- BrGlamorousButtonExteriorAptitude ].
		
	dropdownAptitude := BrGlamorousWithDropdownAptitude
		handle: dropdownHandleBuilder
		content: clsListBuilder.
			
	dropdownAptitude doNotShowOnClick.
	
	self
		aptitude: BrGlamorousButtonWithLabelAptitude new;
		addAptitude: dropdownAptitude;
		action: [ :buttonElement :buttonModel :event | 
			event target phlow spawnObject: self object ];
		addEventHandlerOn: BlMouseUpEvent
			do: [ :evt |
				evt secondaryButtonPressed ifTrue: [  
					self fireEvent: BrDropdownShowWish new ] ];
		beSmallSize
]

{ #category : #accessing }
MATokenElement >> object [

	^ object
]

{ #category : #accessing }
MATokenElement >> object: anObject [

	object := anObject
]

{ #category : #accessing }
MATokenElement >> removeAction [

	^ removeAction ifNil: [ [ self removeFromParent ] ]
]

{ #category : #accessing }
MATokenElement >> removeAction: aValuable [

	removeAction := [ 
		aValuable cull: self object.
		self removeFromParent ]
]
