*magritte-deprecated
magritteUnregister: anObject forMethodChangeNotificationsUsing: selector
	"Unregister anObject with the system for notification whenever a method is
	added, removed, or modified. anObject should no longer receive notifications
	using the specified selector."
	
	SystemChangeNotifier uniqueInstance
		noMoreNotificationsFor: anObject