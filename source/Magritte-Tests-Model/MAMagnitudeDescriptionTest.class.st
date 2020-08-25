Class {
	#name : #MAMagnitudeDescriptionTest,
	#superclass : #MAElementDescriptionTest,
	#category : 'Magritte-Tests-Model-Description'
}

{ #category : #testing }
MAMagnitudeDescriptionTest class >> isAbstract [
	^ true
]

{ #category : #private }
MAMagnitudeDescriptionTest >> actualClass [
	^ MAMagnitudeDescription
]

{ #category : #private }
MAMagnitudeDescriptionTest >> excludedInstance [
	self subclassResponsibility
]

{ #category : #private }
MAMagnitudeDescriptionTest >> maxInstance [
	self subclassResponsibility
]

{ #category : #private }
MAMagnitudeDescriptionTest >> minInstance [
	self subclassResponsibility
]

{ #category : #tests }
MAMagnitudeDescriptionTest >> testInfToInf [
	self assert: self description min isNil.
	self assert: self description max isNil.

	self assert: (self description isSatisfiedBy: self minInstance).
	self assert: (self description isSatisfiedBy: self includedInstance).
	self assert: (self description isSatisfiedBy: self maxInstance)
]

{ #category : #tests }
MAMagnitudeDescriptionTest >> testInfToVal [
	self description max: self includedInstance.

	self assert: self description min isNil.
	self assert: self description max = self includedInstance.

	self assert: (self description isSatisfiedBy: self minInstance).
	self assert: (self description isSatisfiedBy: self includedInstance).
	self deny: (self description isSatisfiedBy: self maxInstance)
]

{ #category : #'tests-accessing' }
MAMagnitudeDescriptionTest >> testMax [
	self description max: self maxInstance.
	self assert: self description max = self maxInstance
]

{ #category : #'tests-accessing' }
MAMagnitudeDescriptionTest >> testMin [
	self description min: self minInstance.
	self assert: self description min = self minInstance
]

{ #category : #'tests-accessing' }
MAMagnitudeDescriptionTest >> testMinMax [
	self description min: self minInstance max: self maxInstance.
	self assert: self description min = self minInstance.
	self assert: self description max = self maxInstance
]

{ #category : #'tests-validation' }
MAMagnitudeDescriptionTest >> testRangeErrorMessage [
	self description
		min: self minInstance;
		max: self maxInstance.
	self assert: self description rangeErrorMessage notEmpty.

	self description rangeErrorMessage: 'zork'.
	self assert: self description rangeErrorMessage = 'zork'.

	self
		should: [ self description validate: self excludedInstance ]
		raiseSingle: MARangeError
		withExceptionDo: [ :err | self assert: self description rangeErrorMessage = err messageText ]
]

{ #category : #'tests-validation' }
MAMagnitudeDescriptionTest >> testRangeErrorMessageGenerated [
	self description min: nil max: nil.
	self assert: self description rangeErrorMessage isNil.
	
	self description min: nil max: self maxInstance.
	self assert: self description rangeErrorMessage notEmpty.
	
	self description min: self minInstance max: nil.
	self assert: self description rangeErrorMessage notEmpty.

	self description min: self minInstance max: self maxInstance.
	self assert: self description rangeErrorMessage notEmpty
]

{ #category : #tests }
MAMagnitudeDescriptionTest >> testValToInf [
	self description min: self includedInstance.

	self assert: self description min = self includedInstance.
	self assert: self description max isNil.

	self deny: (self description isSatisfiedBy: self minInstance).
	self assert: (self description isSatisfiedBy: self includedInstance).
	self assert: (self description isSatisfiedBy: self maxInstance)
]

{ #category : #tests }
MAMagnitudeDescriptionTest >> testValToVal [
	self description min: self includedInstance.
	self description max: self includedInstance.

	self assert: self description min = self includedInstance.
	self assert: self description max = self includedInstance.

	self deny: (self description isSatisfiedBy: self minInstance).
	self assert: (self description isSatisfiedBy: self includedInstance).
	self deny: (self description isSatisfiedBy: self maxInstance)
]

{ #category : #'tests-validation' }
MAMagnitudeDescriptionTest >> testValidateSpecific [
	super testValidateSpecific.
	self description
		min: self minInstance;
		max: self maxInstance.
	self
		shouldnt: [ self description validate: self includedInstance ]
		raise: MARangeError.
	self
		should: [ self description validate: self excludedInstance ]
		raiseSingle: MARangeError
]
