Class {
	#name : #MAContainerDecoration,
	#superclass : #MAComponentDecoration,
	#category : 'Magritte-Seaside-Decorations'
}

{ #category : #accessing }
MAContainerDecoration >> buttons [
	"Answer a collection of associations. The key is either a symbol that will be performed on the decorated component or a one-argument block that will be executed with the component as argument. The value is the button label."
	
	self subclassResponsibility
]

{ #category : #accessing }
MAContainerDecoration >> default [
	^ self buttons first key
]

{ #category : #actions }
MAContainerDecoration >> execute: anObject [
	anObject isSymbol
		ifFalse: [ anObject cull: self decoratedComponent ]
		ifTrue: [ self decoratedComponent perform: anObject ]
]

{ #category : #rendering }
MAContainerDecoration >> renderButtonsOn: html [
	html div class: 'buttons'; with: [
		self buttons do: [ :each |
			html submitButton
				accessKey: each value first;
				callback: [ self execute: each key ];
				text: each value ] ]
]

{ #category : #rendering }
MAContainerDecoration >> renderContentOn: html [
	html form
		class: 'magritte';
		multipart: self requiresMultipartForm;
		defaultAction: [ self execute: self default ];
		with: [
			super renderContentOn: html.
			self renderButtonsOn: html ]
]

{ #category : #testing }
MAContainerDecoration >> requiresMultipartForm [
	^ self decoratedComponent requiresMultipartForm
]
