"
A dynamic object can be used for almost any property within Magritte that is not static but calculated dynamically. This is a shortcut to avoid having to build context sensitive descriptions manually over and over again, however there are a few drawbacks: 

- Some messages sent to this proxy, for example ==#class== and ==#value==, might not get resolved properly.
- Raising an unhandled exception will not always open a debugger on your proxy, because tools are unable to properly work with the invalid object and might even crash your image.
"
Class {
	#name : #MADynamicObject,
	#superclass : #MAProxyObject,
	#category : 'Magritte-Deprecated'
}

{ #category : #accessing }
MADynamicObject >> realSubject [
	^ GRPlatform current
		magritteEvaluate: super realSubject
		onUnhandledErrorDo: [ :err | err return: nil ]
]
