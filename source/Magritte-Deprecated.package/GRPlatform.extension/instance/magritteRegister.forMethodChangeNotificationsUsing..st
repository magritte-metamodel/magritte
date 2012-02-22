*magritte-deprecated
magritteRegister: anObject forMethodChangeNotificationsUsing: selector
	"Register anObject with the system to be notified whenever a method is
	added, removed, or modified. When this happens, the specified selector
	should be called on anObject."
	
	self subclassResponsibility