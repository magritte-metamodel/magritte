Class {
	#name : #MAOptionboxColumn,
	#superclass : #MASelectionColumn,
	#category : 'Magritte-Seaside-Report'
}

{ #category : #'accessing-defaults' }
MAOptionboxColumn >> defaultSelection [
	^ nil
]

{ #category : #'accessing-defaults' }
MAOptionboxColumn >> defaultStringDeselected [
	^ self webdings: '&nbsp;'
]

{ #category : #'accessing-defaults' }
MAOptionboxColumn >> defaultStringSelected [
	^ self webdings: 'a'
]

{ #category : #actions }
MAOptionboxColumn >> deselectRow: anObject [
	self selection: nil
]

{ #category : #testing }
MAOptionboxColumn >> isSelected: anObject [
	^ self selection == anObject
]

{ #category : #private }
MAOptionboxColumn >> radioGroupFor: html [
	"This is a very bad thing, you might never have seen in your own life. Very strange things might happen here, but for now it mostly does what we need."

	| renderer |
	renderer := self propertyAt: #radioGroupRenderer ifAbsentPut: nil.
	^ renderer == html
		ifTrue: [ self propertyAt: #radioGroupCallback ]
		ifFalse: [
			self propertyAt: #radioGroupRenderer put: html.
			self propertyAt: #radioGroupCallback put: html radioGroup ]
]

{ #category : #rendering }
MAOptionboxColumn >> renderCellFormContent: anObject on: html [
	html radioButton
		group: (self radioGroupFor: html);
		selected: (self isSelected: anObject);
		callback: [ self selectRow: anObject ]
]

{ #category : #actions }
MAOptionboxColumn >> selectRow: anObject [
	self selection: anObject
]
