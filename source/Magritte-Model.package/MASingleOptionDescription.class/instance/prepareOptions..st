private
prepareOptions: aCollection
	^ self isRequired
		ifTrue: [ super prepareOptions: aCollection ]
		ifFalse: [ (Array with: nil) , (super prepareOptions: aCollection) ]