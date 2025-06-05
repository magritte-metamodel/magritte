Class {
	#name : 'MAValidatorVisitorTest',
	#superclass : 'TestCase',
	#category : 'Magritte-Tests-Model-Visitor'
}

{ #category : 'tests' }
MAValidatorVisitorTest >> testUndefinedValue [
	self
		shouldnt: [ 
			MAValidatorVisitor new
				validate: 'null'
				using:
					(MABooleanDescription new
						undefinedValue: 'null';
						yourself) ]
		raise: MAKindError
]
