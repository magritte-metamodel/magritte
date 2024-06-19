Class {
	#name : #MADeveloperTests,
	#superclass : #TestCase,
	#category : #'Magritte-Developer-Tests'
}

{ #category : #accessing }
MADeveloperTests >> testGenerateDescriptionSource [

	| desc |
	desc := MANumberDescription new
		default: 5;
		yourself.
		
	self
		assert: desc storeString
		equals: 'MANumberDescription new
	default: 5;
	yourself'
]
