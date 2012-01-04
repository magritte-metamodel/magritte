tests-enumerating
testKeysAndValuesDo
	self description
		add: self child1;
		add: self child2.
	self description keysAndValuesDo: 
		[ :index :each | 
		index = 1 
			ifTrue: [ self assert: self child1 = each ]
			ifFalse: 
				[ index = 2 
					ifTrue: [ self assert: self child2 = each ]
					ifFalse: [ self assert: false ] ] ]