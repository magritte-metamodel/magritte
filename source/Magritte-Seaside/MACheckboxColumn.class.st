Class {
	#name : #MACheckboxColumn,
	#superclass : #MASelectionColumn,
	#category : 'Magritte-Seaside-Report'
}

{ #category : #'accessing-defaults' }
MACheckboxColumn >> defaultSelection [
	^ Set new
]

{ #category : #'accessing-defaults' }
MACheckboxColumn >> defaultStringDeselected [
	^ self webdings: 'c'
]

{ #category : #'accessing-defaults' }
MACheckboxColumn >> defaultStringSelected [
	^ self webdings: 'g'
]

{ #category : #actions }
MACheckboxColumn >> deselectRow: anObject [
	self selection remove: anObject ifAbsent: nil
]

{ #category : #testing }
MACheckboxColumn >> isSelected: anObject [
	^ self selection includes: anObject
]

{ #category : #rendering }
MACheckboxColumn >> renderCellFormContent: anObject on: html [
	html checkbox
		value: (self isSelected: anObject);
		callback: [ :value | self selectRow: anObject value: value ]
]

{ #category : #actions }
MACheckboxColumn >> selectRow: anObject [
	self selection add: anObject
]
