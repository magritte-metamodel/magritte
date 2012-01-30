accessing
theClass
	| class |
	class := self classObjectFor: className asSymbol.
	^ class isMeta ifFalse: [ class theMetaClass ] ifTrue: [ class ]