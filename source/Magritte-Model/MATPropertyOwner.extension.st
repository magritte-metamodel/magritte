Extension { #name : #MATPropertyOwner }

{ #category : #'*Magritte-Model' }
MATPropertyOwner >> maLazyPropertyUsing: description [
	"Return the current value of a field as specified by its description. See #lazilyInitializeFrom:for: comment for more info.
		- NB: Only works with a selector accessor with matching property e.g. (readSelector = property = #myField). It could be extended to other cases if the need arises."

	| currentValue |
	currentValue := self propertyAt: description accessor readSelector ifAbsent: [ nil ].
	^ description lazilyInitializeFrom: currentValue for: self.
]
