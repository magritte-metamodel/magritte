*magritte-model-builder
magritteDescription
	|basicDescription builders|
	basicDescription := self basicMagritteDescription.
	builders := self magritteDescriptionBuilders.
	builders ifNotNil: [^builders buildFrom: basicDescription target: self].
	^basicDescription