Extension { #name : #Object }

{ #category : #'*magritte-model-accessing' }
Object >> basicMagritteDescription [
	^ MAPragmaBuilder for: self
]

{ #category : #'*magritte-model-accessing' }
Object >> descriptionContainer [
	"Return the default description container."
	<magritteContainer>
	^ MAPriorityContainer new
		label: self class label;
		yourself
]

{ #category : #'*magritte-model-model' }
Object >> initializeMagritte [
	"Initializes the receiving object with the default values of its description."

	self magritteDescription do: [ :each |
		each isReadonly
			ifFalse: [ self write: each default using: each ] ]
]

{ #category : #'*magritte-model-testing' }
Object >> isDescription [
	^ false
]

{ #category : #'*magritte-model-actions' }
Object >> magritteActions [

	| descriptionSelectors descriptions |
	descriptionSelectors := self uniqueActionSelectors.
	descriptions := descriptionSelectors collect: [ :e | self perform: e ].
	^ descriptions collect: [ :e | e buttonOn: self ].
]

{ #category : #'*magritte-model-accessing' }
Object >> magritteDescription [
	^ self basicMagritteDescription
]

{ #category : #'*magritte-model-description' }
Object class >> magritteTemplate [
	"Allow subclasses to have a prototype instance for creating a Magritte description (especially reference description)."
	^self new
]

{ #category : #'*magritte-model-accessing' }
Object >> mementoClass [
	"Return a class to be used to remember or cache the receiver, namely a memento object."

	^ MACheckedMemento
]

{ #category : #'*magritte-model-model' }
Object >> readUsing: aDescription [
	"Dispatch the read-access to the receiver using the accessor of aDescription."

	^ aDescription accessor read: self
]

{ #category : #'*magritte-model-actions' }
Object >> uniqueActionSelectors [

	| descriptionPragmas selectors |	
	descriptionPragmas := Pragma 
		allNamed: #magritteActionDescription
		from: self class to: Object.
		
	selectors := descriptionPragmas collect: [ :each | each method selector ].
	
	^ Set withAll: selectors
]

{ #category : #'*magritte-model-model' }
Object >> write: anObject using: aDescription [
	"Dispatch the write-access to the receiver of anObject using the accessor of aDescription."

	aDescription accessor write: anObject to: self
]
