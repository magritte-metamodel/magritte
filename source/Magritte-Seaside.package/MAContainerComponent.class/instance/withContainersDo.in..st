private
withContainersDo: aBlock in: aComponent
	"This does a depth first search through all children and evaluates a block for all container components that have their own memento."
	
	aComponent childrenDo: [ :each |
		self withContainersDo: aBlock in: each ].
	aComponent isMagritteContainer
		ifTrue: [ aBlock value: aComponent ]