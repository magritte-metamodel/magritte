*magritte-deprecated
magritteRegister: anObject forMethodChangeNotificationsUsing: selector
	"Register anObject with the system to be notified whenever a method is
	added, removed, or modified. When this happens, the specified selector
	should be called on anObject."
	
	SystemChangeNotifier uniqueInstance
		notify: anObject ofSystemChangesOfItem: #method change: #Added using: selector;
		notify: anObject ofSystemChangesOfItem: #method change: #Modified using: selector;
		notify: anObject ofSystemChangesOfItem: #method change: #Removed using: selector