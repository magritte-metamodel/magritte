private
withContainersDo: aBlock
	"This does a depth first search through all children and evaluates a block for all container components that have their own memento."
	
	self withContainersDo: aBlock in: self