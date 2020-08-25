"
A SliderModel is a spec model for a slider
"
Class {
	#name : #SliderModel,
	#superclass : #AbstractBasicWidget,
	#instVars : [
		'max',
		'min',
		'quantum',
		'value',
		'isSetting',
		'isChanging',
		'absoluteValue',
		'labelHolder'
	],
	#category : 'Spec-Widgets'
}

{ #category : #specs }
SliderModel class >> defaultSpec [
	<spec>
	
	^ SpecLayout slider
		send: #model: withArguments: #( model );
		send: #getValueSelector: withArguments: #(value);
		send: #setValueSelector: withArguments: #( value: );
		send: #value: withArguments: #(#(model absoluteValue));
		send: #getLabelSelector: withArguments: #( label );
		send: #max: withArguments: #(#(model max));
		send: #min: withArguments: #(#(model min));		
		send: #quantum: withArguments: #(#(model quantum));
		send: #borderWidth: withArguments: #(#(model borderWidth));
		send: #borderColor: withArguments: #(#(model borderColor));
		send:#setBalloonText: withArguments:	#(#(model help));
		send: #vSpaceFill;
		send: #hSpaceFill;
		yourself
]

{ #category : #morphic }
SliderModel >> absoluteValue [
	<api: #inspect>
	"Return the position of the slider in a scale between 0 and 1 despite of the min and max value"
	^ absoluteValue contents
]

{ #category : #morphic }
SliderModel >> absoluteValue: aFloat [
	<api: #float min: 0 max: 1 getter:#absoluteValue registration: #whenAbsoluteValueChanged:>
	"Set the position of the slider in a scale between 0 and 1 despite of the min and max value"

	absoluteValue contents: aFloat
]

{ #category : #'as yet unclassified' }
SliderModel >> color: aColor [

	self widget ifNotNil: [:w | w == self ifFalse: [ super color: aColor ]]
]

{ #category : #morphic }
SliderModel >> defaultValue [

	^ 50
]

{ #category : #initialize }
SliderModel >> initialize [
	"Initialization code for SliderModel"

	super initialize.

	max := 10 asValueHolder.
	min := 0 asValueHolder.
	quantum := 1 asValueHolder.
	value := 5 asValueHolder.
	absoluteValue := 0.5 asValueHolder.
	labelHolder := '' asValueHolder.
	isChanging := false.
	
	max whenChangedDo: [:m | self widget ifNotNil: [:w | w max: m ]].
	min whenChangedDo: [:m | self widget ifNotNil: [:w | w min: m ]].
	quantum whenChangedDo: [:m | self widget ifNotNil: [:w | w quantum: m ]].
	
	value whenChangedDo: [:v |
		isChanging ifFalse: [
			isChanging := true.
			self absoluteValue: ((v-self min)/(self max-self min)).
			self widget ifNotNil: [:w | w == self ifFalse: [ w scaledValue: v ]].
			isChanging := false ]].
	
	absoluteValue whenChangedDo: [:v | 
		isChanging ifFalse: [
			isChanging := true.
			self value: (self min+(v*(self max-self min)) roundTo: self quantum).
			self widget ifNotNil: [:w | w == self ifFalse: [ w value: v ]].
			isChanging := false ]].
	
	labelHolder whenChangedDo: [	self widget ifNotNil: [:w | w updateLabel ]].
]

{ #category : #morphic }
SliderModel >> label [
	<api: #inspect>
	"Return the label of the slider"
	
	^ labelHolder contents
]

{ #category : #protocol }
SliderModel >> label: aString [
	<api: #string getter: #label registration: #whenLabelChanged:>
	"Set the label of the slider"
	
	labelHolder contents: aString
]

{ #category : #morphic }
SliderModel >> max [
	<api: #inspect>
	"Return the maximun value"
	
	^ max contents
]

{ #category : #protocol }
SliderModel >> max: anObject [
	<api: #integer min: 1 max: 100 getter:#max registration: #whenMaxChanged:>
	"Set the maximun value"

	max contents: anObject
]

{ #category : #morphic }
SliderModel >> min [
	<api: #inspect>
	"Return the minimum value"
	
	^ min contents
]

{ #category : #protocol }
SliderModel >> min: anObject [
	<api: #integer min: 0 max: 99 getter:#min registration: #whenMinChanged:>
	"Set the minimum value"
	
	min contents: anObject
]

{ #category : #morphic }
SliderModel >> quantum [
	<api: #inspect>
	"Return the quantum betwen values"

	^ quantum contents
]

{ #category : #protocol }
SliderModel >> quantum: aNumber [
	<api: #integer min: #min max: #max getter:#quantum registration: #whenQuantumChanged:>
	"Set the quantum betwen values"

	quantum contents: aNumber
]

{ #category : #protocol }
SliderModel >> reset [
	<api:#do>
	"Reset the cursor to the minimum value"
	
	self value: self min
]

{ #category : #morphic }
SliderModel >> value [
	<api: #inspect>
	"Return the current value in a range between min and max"

	^ value contents
]

{ #category : #protocol }
SliderModel >> value: aNumber [
	<api: #integer min: #min max: #max getter:#value registration: #whenValueChanged:>
	"Set the value in a range between min and max"

	value contents: aNumber.
	self changed: #value.
]

{ #category : #'protocol-events' }
SliderModel >> whenAbsoluteValueChangedDo: aBlock [
	<api: #event>
	"Block performed when the absolute value changed"

	absoluteValue whenChangedDo: aBlock
]

{ #category : #'protocol-events' }
SliderModel >> whenLabelChangedDo: aBlock [
	<api: #event>
	"Block performed when the label changed"

	labelHolder whenChangedDo: aBlock
]

{ #category : #'protocol-events' }
SliderModel >> whenMaxChangedDo: aBlock [ 
	<api: #event>
	"Block performed when the maximum value changed"

	max whenChangedDo: aBlock
]

{ #category : #'protocol-events' }
SliderModel >> whenMinChangedDo: aBlock [ 
	<api: #event>
	"Block performed when the minimum value changed"

	min whenChangedDo: aBlock
]

{ #category : #'protocol-events' }
SliderModel >> whenQuantumChangedDo: aBlock [ 
	<api: #event>
	"Block performed when the quantum value changed"

	quantum whenChangedDo: aBlock
]

{ #category : #'protocol-events' }
SliderModel >> whenValueChangedDo: aBlock [ 
	<api: #event>
	"Block performed when the value changed"

	value whenChangedDo: aBlock
]
