Class {
	#name : #MAPatchMacroElement,
	#superclass : #BlElement,
	#instVars : [
		'model',
		'expander',
		'header'
	],
	#category : #'Magritte-Merging'
}

{ #category : #examples }
MAPatchMacroElement class >> example [
	<gtExample>
	^ MAPatchMacro example asElement
]

{ #category : #'instance creation' }
MAPatchMacroElement class >> on: macro [
	^ self new
		model: macro;
		yourself
]

{ #category : #accessing }
MAPatchMacroElement >> initialize [
	super initialize.
	
	"Adapted from GtRefactoringsElement"
	self 
		layout: BlFrameLayout new;
		constraintsDo: [ :c | 
				c horizontal matchParent.
				c vertical fitContent ].
	
	expander := BrExpander new
		hMatchParent;
		vFitContent;
		aptitude: (GtCoderExpanderAptitude new
			padding: BlInsets empty;
			doNotReplaceHeader) + (BrStyleCommonAptitude new
				expanded: [ :aStyle |
					aStyle margin: (BlInsets top: 5 left: 5 bottom: 5 right: 5) ];
				collapsed: [ :aStyle |
					aStyle margin: (BlInsets top: 5 left: 5 bottom: 0 right: 5) ]);
		yourself.
	
	self addChild: expander.
	^ self
]

{ #category : #accessing }
MAPatchMacroElement >> model [
	^ model
]

{ #category : #accessing }
MAPatchMacroElement >> model: macro [
	model := macro.
	
	expander header: [
		| label  button |
		label := BrButton new
			action: [ expander toggleExpanded ];
			aptitude: BrGlamorousButtonWithLabelAptitude;
			label: self model printString.
		button := BrButton new
				beSmallSize;
				aptitude: BrGlamorousButtonWithLabelAptitude;
				label: 'Apply';
				action: [ self model execute ].
		BlElement new
			"aptitude: BrGlamorousAccordionHeaderAptitude new;"
			layout: (BlLinearLayout horizontal cellSpacing: 10);
			constraintsDo: [ :c | 
				c horizontal fitContent.
				c vertical fitContent ];
			addChild: label;
			addChild: button;
			yourself ].
	
	expander content: [ 
		| content | 
		content := BlElement new
			layout: (BlLinearLayout vertical cellSpacing: 10);
			constraintsDo: [ :c | 
				c horizontal fitContent.
				c vertical fitContent ].
		self model operations do: [ :op | content addChild: op asElement ].
		content ].
]

{ #category : #accessing }
MAPatchMacroElement >> rule: aRule targetingGroup: group [
	self model: aRule patch
]
