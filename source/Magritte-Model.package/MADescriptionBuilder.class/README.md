A MADescriptionBuilder is an abstract class for enriching a Magritte description, e.g. setting the component class based on the description class.


Instance Variables:
	model: the root object
	target:  the object the current description belongs to
	priority: when multiple builders are used, this determines the priority.
	buildedDescription: The result