Extension { #name : #GRPlatform }

{ #category : #'*magritte-deprecated' }
GRPlatform >> magritteEvaluate: aBlock onUnhandledErrorDo: errorBlock [
	"Evaluate aBlock. If an Error is signaled and is not handled higher up the
	stack, evaluate errorBlock with the Error instead of opening a debugger."
	
	self subclassResponsibility
]

{ #category : #'*magritte-deprecated' }
GRPlatform >> magritteRegister: anObject forMethodChangeNotificationsUsing: selector [
	"Register anObject with the system to be notified whenever a method is
	added, removed, or modified. When this happens, the specified selector
	should be called on anObject."
	
	self subclassResponsibility
]

{ #category : #'*magritte-deprecated' }
GRPlatform >> magritteUnregister: anObject forMethodChangeNotificationsUsing: selector [
	"Unregister anObject with the system for notification whenever a method is
	added, removed, or modified. anObject should no longer receive notifications
	using the specified selector."
	
	self subclassResponsibility
]
