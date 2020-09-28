Extension { #name : #BlockContext }

{ #category : #'*magritte-deprecated' }
BlockContext >> magritteDynamicObject [
	"Answer an object that will automatically evaluate the receiver when it receives a message. It will eventually pass the message to the resulting object. Use with caution, for details see *MADynamicObject*."
	
	self greaseDeprecatedApi: 'BlockContext>>#magritteDynamicObject' details: '#magritteDynamicObject is no longer necessary as descriptions are now dynamically created'. 

	^ MADynamicObject on: self
]
