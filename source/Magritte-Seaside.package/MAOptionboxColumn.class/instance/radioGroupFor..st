private
radioGroupFor: html
	"This is a very bad thing, you might never have seen in your own life. Very strange things might happen here, but for now it mostly does what we need."

	| renderer |
	renderer := self propertyAt: #radioGroupRenderer ifAbsentPut: nil.
	^ renderer == html
		ifTrue: [ self propertyAt: #radioGroupCallback ]
		ifFalse: [
			self propertyAt: #radioGroupRenderer put: html.
			self propertyAt: #radioGroupCallback put: html radioGroup ]