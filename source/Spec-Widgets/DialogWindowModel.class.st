"
A DialogWindowModel is a model used to describe a DialogWindow
"
Class {
	#name : 'DialogWindowModel',
	#superclass : 'WindowModel',
	#instVars : [
		'contentMorph'
	],
	#category : 'Spec-Widgets'
}

{ #category : 'specs' }
DialogWindowModel class >> defaultSpec [
	<spec>
	
	^ #( DialogWindowSpec 
			specWidget: #(model contentMorph)
			initialize
			model: model )
]

{ #category : 'private' }
DialogWindowModel >> buildWithSpec: aSpec [
	"Build the widget using the spec name provided as argument"
	| widget |
	
	(self spec notNil and: [ self needRebuild not ])
		ifTrue: [ widget := self spec instance ]
		ifFalse: [ 
			contentMorph := self model ifNil: [ nil ] ifNotNil: [:m | m buildWithSpec: aSpec ].
			widget := SpecInterpreter buildWidgetFor: self withSpec: self defaultSpecSelector.
			contentMorph := nil ].

	self extent ifNotNil: [:ex | 
		(widget respondsTo: #extent:)
			ifTrue: [ widget extent: ex ]].
		
	^ widget
]

{ #category : 'private' }
DialogWindowModel >> buildWithSpecLayout: aSpec [
	"Build the widget using the spec name provided as argument"
	| widget |
	
	(self spec notNil and: [ self needRebuild not ])
		ifTrue: [ widget := self spec instance ]
		ifFalse: [ 
			contentMorph := self model buildWithSpecLayout: aSpec.
			widget := SpecInterpreter buildWidgetFor: self withSpec: self defaultSpecSelector.
			contentMorph := nil ].

	self extent ifNotNil: [:ex | 
		(widget respondsTo: #extent:)
			ifTrue: [ widget extent: ex ]].
		
	^ widget
]

{ #category : 'protocol' }
DialogWindowModel >> cancelAction: aBlock [

	^ self widget
		ifNotNil: [:w | w cancelAction: aBlock ]
]

{ #category : 'protocol' }
DialogWindowModel >> cancelled [

	^ self widget
		ifNil: [ false ]
		ifNotNil: [:w | w cancelled ]
]

{ #category : 'accessing' }
DialogWindowModel >> contentMorph [

	^ contentMorph
]

{ #category : 'protocol' }
DialogWindowModel >> okAction: aBlock [

	^ self widget
		ifNotNil: [:w | w okAction: aBlock ]
]

{ #category : 'protocol' }
DialogWindowModel >> toolbar [

	^ self widget
		ifNotNil: [:w | w toolbar ]
]
