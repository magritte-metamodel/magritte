Extension { #name : #GRPharoPlatform }

{ #category : #'*magritte-deprecated' }
GRPharoPlatform >> magritteEvaluate: aBlock onUnhandledErrorDo: errorBlock [
	"Evaluate aBlock. If an Error is signaled and is not handled higher up the
	stack, evaluate errorBlock with the Error instead of opening a debugger."
	
	"Apparently allowing #on:do: to be inlined by the compiler is faster than
	passing errorBlock directly in as a parameter."
	^ aBlock
		on: UnhandledError
		do: [ :error | errorBlock value: error ]
]

{ #category : #'*magritte-deprecated' }
GRPharoPlatform >> magritteRegister: anObject forMethodChangeNotificationsUsing: selector [
	"Register anObject with the system to be notified whenever a method is
	added, removed, or modified. When this happens, the specified selector
	should be called on anObject."
	
	SystemChangeNotifier uniqueInstance
		notify: anObject ofSystemChangesOfItem: #method change: #Added using: selector;
		notify: anObject ofSystemChangesOfItem: #method change: #Modified using: selector;
		notify: anObject ofSystemChangesOfItem: #method change: #Removed using: selector
]

{ #category : #'*magritte-deprecated' }
GRPharoPlatform >> magritteUnregister: anObject forMethodChangeNotificationsUsing: selector [
	"Unregister anObject with the system for notification whenever a method is
	added, removed, or modified. anObject should no longer receive notifications
	using the specified selector."
	
	SystemChangeNotifier uniqueInstance
		noMoreNotificationsFor: anObject
]
