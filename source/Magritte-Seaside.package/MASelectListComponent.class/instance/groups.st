accessing-model
groups
	"The options objects are assumed to understand the 'groupBy' selector supplied by the description object. Keep the global ordering intact."

	| groups group |
	groups := OrderedCollection new.
	self options do: [ :option | 
		option isNil ifFalse: [
			group := self magritteDescription groupBy read: option.
			(groups
				detect: [ :each | each key = group ]
				ifNone: [ groups addLast: group -> OrderedCollection new ])
					value addLast: option ] ].
	^ groups