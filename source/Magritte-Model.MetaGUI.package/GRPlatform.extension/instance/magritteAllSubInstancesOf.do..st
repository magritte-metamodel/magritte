*magritte-model
magritteAllSubInstancesOf: aClass do: aBlock
	"Evaluate the aBlock for all instances of aClass and all its subclasses."
	
	self subclassResponsibility