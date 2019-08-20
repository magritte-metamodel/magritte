*Magritte-Model
magritteAllDescriptionsFor: aDescriptionSelector
	"Experiment: What if our object has a field that can be thought of in different ways? For example, a messages field that can be filtered into #read, #unread, and #all. #descriptionMessages would be the actual description, and then there could be a #descriptionUnreadMessages and #descriptionReadMessages which are dcescriptions of the filtered collections. By annotating these alternate descriptions with <magritteAltFor: #descriptionMessages order: aNumber>, these could be e.g. displayed as tabs in a Magritte form"
	
	^ OrderedCollection new
			add: (self perform: aDescriptionSelector);
			addAll: (self magritteAlternatesFor: aDescriptionSelector);
			sort;
			yourself