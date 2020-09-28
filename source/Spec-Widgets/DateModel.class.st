"
A DateModel is a widget for choosing dates. It consists of:
- A text box, into which you can type any string which can be converted into a Smalltalk date
- A button, which displays a calendar, from which you can select a date

Usage: the simplest way is to add a DateModel in your UI, and send #date when you want its value.

As it is Spec-based, it can be easily adapted and composed into a larger UI.
"
Class {
	#name : #DateModel,
	#superclass : #ComposableModel,
	#instVars : [
		'dateLabel',
		'chooseDateButton',
		'dateModel',
		'displayBlockHolder'
	],
	#category : 'Spec-Widgets-PolyWidgets'
}

{ #category : #'as yet unclassified' }
DateModel class >> spec [
	<spec: #default>

	^ SpecLayout composed
			newRow: [ :row | 
				row 
					add: #dateLabel width: 60; 
					"This is to address a not yet fixed Spec issue"
					newRow: [:ugly | 
						ugly
							add: #dateModel;  
							add: #chooseDateButton width: 50 ]] height: 25
			yourself.
]

{ #category : #private }
DateModel >> chooseDate [

	| calendar |
	calendar := CalendarMorph openOn: Date today.
	calendar onChoiceSend: #onDateChosen: to: self.
]

{ #category : #'accessing-widgets' }
DateModel >> chooseDateButton [

	^ chooseDateButton.
]

{ #category : #accessing }
DateModel >> date [

	^ self dateModel getText asDate.
]

{ #category : #accessing }
DateModel >> date: aDate [

	| string |
	string := displayBlockHolder contents value: aDate.
	^ self dateModel text: string.
]

{ #category : #'accessing-widgets' }
DateModel >> dateLabel [

	^ dateLabel.
]

{ #category : #'accessing-widgets' }
DateModel >> dateModel [

	^ dateModel.
]

{ #category : #'as yet unclassified' }
DateModel >> displayBlock [
	<api: #inspect>
	"Return the one argument block used to wrap your domain specific items.
	The block should return something that can be displayed in a list - like a String or a Text"
	
	^ displayBlockHolder contents
]

{ #category : #'as yet unclassified' }
DateModel >> displayBlock: aBlock [
	<api: #block getter:#displayBlock registration: #whenDisplayBlockChanged:>
	"Set the one argument block used to transfrom your date into a string"
	
	displayBlockHolder contents: aBlock
]

{ #category : #private }
DateModel >> iconMorph [

	^ ImageMorph new image: ThemeIcons calendarIcon.
]

{ #category : #initialization }
DateModel >> initialize [

	displayBlockHolder := [ :object | object asStringOrText ] asValueHolder.
	displayBlockHolder whenChangedDo: [ self date: self date ].
	super initialize. "do this last so default will be set after displayBlock"
]

{ #category : #initialization }
DateModel >> initializeWidgets [

	self instantiateModels: #(
		dateLabel LabelModel
		dateModel TextInputFieldModel
		chooseDateButton ButtonModel).
	
	dateLabel
		text: 'Date'.
		
	self date: Date today.
	dateModel
		isCodeCompletionAllowed: false.
	
	chooseDateButton
		label: self iconMorph;
		action: [ self chooseDate ];
		extent: self iconMorph extent.
]

{ #category : #private }
DateModel >> onDateChosen: aChoseDate [

	aChoseDate calendar delete.
	self date: aChoseDate date.
]

{ #category : #'protocol-events' }
DateModel >> whenDateChanged: aBlock [

	dateModel whenTextChanged: [:newText :oldText :announcement :announcer || newDate oldDate |
		newDate := Date readFrom: newText readStream.
		oldDate := Date readFrom: oldText readStream.
		aBlock cull: newDate cull: oldDate cull: announcement cull: announcer ]
]
