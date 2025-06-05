"
A LabelModel is a spec model for Labels
"
Class {
	#name : 'LabelModel',
	#superclass : 'AbstractBasicWidget',
	#instVars : [
		'textHolder'
	],
	#category : 'Spec-Widgets'
}

{ #category : 'specs' }
LabelModel class >> defaultSpec [
	<spec>
	^ {#LabelSpec.
			#model:. 				#model.
			#getEnabledSelector:.	#enabled.
			#getTextSelector:.		#getText.
			#vResizing:.			#shrinkWrap.
			#hResizing:.			#spaceFill.
			#borderWidth:.						#(model borderWidth).
			#borderColor:.						#(model borderColor).
			#setBalloonText:.					{ #model . #help}}
]

{ #category : 'specs' }
LabelModel class >> title [

	^ 'Label Morph'
]

{ #category : 'morphic' }
LabelModel >> getText [
	<api: #inspect>

	^ textHolder contents
]

{ #category : 'initialization' }
LabelModel >> initialize [
	"Initialization code for LabelModel"

	super initialize.

	textHolder := '' asValueHolder.
	enabledHolder := true asValueHolder.
	textHolder whenChangedDo: [ self changed: #getText ].
]

{ #category : 'protocol' }
LabelModel >> text: aText [
	<api: #string getter: #getText registration: #whenTextChanged:>
	"Set the text of the label"
	
	textHolder contents: aText
]

{ #category : 'protocol-events' }
LabelModel >> whenTextChanged: aBlock [
	<api: #event>
	"Set a block to performed when the text is changed"
	
	textHolder whenChangedDo: aBlock
]
