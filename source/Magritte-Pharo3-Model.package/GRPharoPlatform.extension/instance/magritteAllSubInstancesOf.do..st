*Magritte-Pharo3-Model
magritteAllSubInstancesOf: aClass do: aBlock
	"Evaluate the aBlock for all instances of aClass and all its subclasses."

	aClass allSubInstancesDo: aBlock