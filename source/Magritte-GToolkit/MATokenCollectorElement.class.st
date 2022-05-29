Class {
	#name : #MATokenCollectorElement,
	#superclass : #BrHorizontalPane,
	#instVars : [
		'relationDescription',
		'spotterAction',
		'tokenClickAction',
		'valueLabel'
	],
	#category : #'Magritte-GToolkit-Widgets'
}

{ #category : #initialization }
MATokenCollectorElement >> initialize [

	| searchButton |
	super initialize.
	
	self
		hMatchParent;
		padding: (BlInsets top: 4 bottom: 4);
		alignCenterLeft;
		cellSpacing: 5;
		vFitContent.
		
	valueLabel := BrLabel new
		aptitude: BrGlamorousLabelAptitude;
		beSmallSize;
		addEventHandlerOn: BlClickEvent
			do: [ :evt | self tokenClickAction cull: evt ];
		yourself.
		
	searchButton := GtSpotterDropdownButtonStencil new
		valuable: [ self relationDescription gtSearchSource value ];
		icon: BrGlamorousVectorIcons search;
		spotterModelDo: [ :sm |
			sm announcer
				when: GtSpotterActOn
				do: [ :evt | 
					self spotterAction cull: evt cull: self.
					evt actedUpon: true ] ];
		create.
	
	self
		addChild: valueLabel;
		addChild: searchButton.
]

{ #category : #accessing }
MATokenCollectorElement >> relationDescription [

	^ relationDescription
]

{ #category : #accessing }
MATokenCollectorElement >> relationDescription: anObject [

	relationDescription := anObject
]

{ #category : #accessing }
MATokenCollectorElement >> spotterAction [

	^ spotterAction
]

{ #category : #accessing }
MATokenCollectorElement >> spotterAction: anObject [

	spotterAction := anObject
]

{ #category : #accessing }
MATokenCollectorElement >> tokenClickAction [

	^ tokenClickAction
]

{ #category : #accessing }
MATokenCollectorElement >> tokenClickAction: anObject [

	tokenClickAction := anObject
]

{ #category : #accessing }
MATokenCollectorElement >> valueLabel [

	^ valueLabel
]

{ #category : #accessing }
MATokenCollectorElement >> valueLabel: anObject [

	valueLabel := anObject
]
