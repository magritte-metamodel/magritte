Extension { #name : 'Object' }

{ #category : '*magritte-model-accessing' }
Object >> basicMagritteDescription [
	^ MAPragmaBuilder for: self
]

{ #category : '*Magritte-Model' }
Object >> descriptionContainer [
	"Return the default description container."
	<magritteContainer>
	^ MAPriorityContainer new
		label: self class label;
		yourself
]

{ #category : '*magritte-model-model' }
Object >> initializeMagritte [
	"Initializes the receiving object with the default values of its description."

	self magritteDescription do: [ :each |
		each isReadOnly
			ifFalse: [ self write: each default using: each ] ]
]

{ #category : '*magritte-model-testing' }
Object >> isDescription [
	^ false
]

{ #category : '*Magritte-Model' }
Object >> isSameAs: rhs [
	^ self isSameAs: rhs using: [ self magritteDescription ]
]

{ #category : '*Magritte-Model' }
Object >> isSameAs: rhs using: descriptionValuable [
	"Use #isSameAs: unless you need to cache the description for efficiency.
	CAUTION: this may not work if the description depends on the instance e.g. uses `self` in a block
	(See comment below for more details)"
	^ descriptionValuable value allSatisfy: [ :desc |
			| myVal rhsVal |
			(desc accessor canRead: rhs)
				ifFalse: [ false ]
				ifTrue: [
					myVal := desc read: self.
					rhsVal := desc read: rhs.
					({ nil. desc default } includesAll: { myVal. rhsVal })
						ifTrue: [ true ]
						ifFalse: [ myVal = rhsVal ] ] ].
	"Motivation: We cache the description because profiling on a large dataset (120,000 records) showed about 66% of processing time was spent (re)building it"
]

{ #category : '*Magritte-Model' }
Object >> maFullPrintString [
	
	^ String streamContents: [ :str | self maPrintOn: str ]
]

{ #category : '*Magritte-Model' }
Object >> maHash [
	^ self maHashUsing: [ self magritteDescription ]
]

{ #category : '*Magritte-Model' }
Object >> maHashUsing: valuabledescription [
	"See isSameAs:using: comments"
	^ valuabledescription value children 
			inject: 0 hash 
			into: [ :hash :desc | hash bitXor: (desc read: self) hash ]
]

{ #category : '*Magritte-Model' }
Object >> maLazyInstVarUsing: description [
	"Return the current value of a field as specified by its description. See #lazilyInitializeFrom:for: comment for more info.
		- NB: Only works with a selector accessor with matching inst var name e.g. (readSelector = instVarName = #myField). It could be extended to other cases if the need arises."

	| currentValue |
	currentValue := self instVarNamed: description accessor readSelector.
	^ description lazilyInitializeFrom: currentValue for: self.
]

{ #category : '*Magritte-Model' }
Object >> maPrintOn: aStream [	
	self magritteDescription print: self on: aStream
]

{ #category : '*Magritte-Model' }
Object >> maValidate [
	^ self magritteDescription validate: self
]

{ #category : '*magritte-model-builder' }
Object >> magritteActions [
	^ (MAActionPragmaBuilder for: self) children
]

{ #category : '*Magritte-Model' }
Object >> magritteAllDescriptionsFor: aDescriptionSelector [
	"Experiment: What if our object has a field that can be thought of in different ways? For example, a messages field that can be filtered into #read, #unread, and #all. #descriptionMessages would be the actual description, and then there could be a #descriptionUnreadMessages and #descriptionReadMessages which are dcescriptions of the filtered collections. By annotating these alternate descriptions with <magritteAltFor: #descriptionMessages>, these could be e.g. displayed as tabs in a Magritte form"
	
	^ OrderedCollection new
			add: (self perform: aDescriptionSelector);
			addAll: (self magritteAlternatesFor: aDescriptionSelector);
			sort;
			yourself
]

{ #category : '*Magritte-Model' }
Object >> magritteAlternatesFor: aDescriptionSelector [
	| altDescriptionMethods relevantDescMeths |
	altDescriptionMethods := Pragma
		allNamed: #magritteAltFor:
		from: self class
		to: Object.
	relevantDescMeths := altDescriptionMethods select: [ :p | p arguments first = aDescriptionSelector ].
	^ relevantDescMeths collect: [ :m | self perform: m method selector ]
]

{ #category : '*magritte-model-builder' }
Object >> magritteDescription [
	|basicDescription builders|
	basicDescription := self basicMagritteDescription.
	builders := self magritteDescriptionBuilders.
	builders ifNotNil: [^builders buildFrom: basicDescription target: self].
	^basicDescription
]

{ #category : '*Magritte-Model' }
Object >> magritteDescriptionBuilders [
	|builderPragmas container|
	builderPragmas := Pragma allNamed: #magritteBuilder from: self class to: Object.
	builderPragmas ifEmpty: [ ^nil ].
	container := QCDescriptionBuilderContainer new.
	builderPragmas do: [ :pragma |
		|bld |
		pragma method numArgs = 0 ifTrue: [ 
			bld := self perform: pragma method selector.
			bld ifNotNil: [ container add: bld ] ] ].
	^container
]

{ #category : '*magritte-model-description' }
Object class >> magritteTemplate [
	"Allow subclasses to have a prototype instance for creating a Magritte description (especially reference description)."
	^self new
]

{ #category : '*Magritte-Model' }
Object >> mementoClass [
	"Return a class to be used to remember or cache the receiver, namely a memento object."

	^ MACheckedMemento
]

{ #category : '*Magritte-Model' }
Object >> readUsing: aDescription [
	"This hook is needed so that e.g. mementos and adaptive models can implement their own behavior. All other entry points e.g. MADescription>>#read: should come through here"

	| result |
	result := aDescription accessor read: self.
	^ result ifNil: [ aDescription undefinedValue ]
]

{ #category : '*Magritte-Model' }
Object >> write: anObject using: aDescription [
	"This hook is needed so that e.g. mementos and adaptive models can implement their own behavior. All other entry points e.g. MADescription>>#read: should come through here"

	aDescription accessor write: anObject to: self
]
