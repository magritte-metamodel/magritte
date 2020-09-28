Class {
	#name : #MATableComponent,
	#superclass : #MAElementComponent,
	#instVars : [
		'descriptionTable',
		'componentTable'
	],
	#category : 'Magritte-Seaside-Components'
}

{ #category : #testing }
MATableComponent class >> isAbstract [
	^ false
]

{ #category : #private }
MATableComponent >> buildComponentTable [
	^ self descriptionTable collect: [ :row :col :each |
		each componentClass
			memento: self
			description: each
			parent: self ]
]

{ #category : #private }
MATableComponent >> buildDataTable [
	^ MATableModel
		rows: self magritteDescription rowCount
		columns: self magritteDescription columnCount
]

{ #category : #private }
MATableComponent >> buildDescriptionTable [
	^ self dataTable collect: 
		[ :row :col :each | 
		self magritteDescription reference copy
			accessor: MANullAccessor new;
			label: row greaseString , '/' , col greaseString;
			propertyAt: #row
				put: row;
			propertyAt: #column
				put: col;
			yourself ]
]

{ #category : #'accessing-dynamic' }
MATableComponent >> children [
	^ self componentTable contents
]

{ #category : #accessing }
MATableComponent >> componentTable [
	^ componentTable ifNil: [ componentTable := self buildComponentTable ]
]

{ #category : #accessing }
MATableComponent >> dataTable [
	self value isNil
		ifTrue: [ self value: self buildDataTable ]
		ifFalse: [
			(self value rowCount = self magritteDescription rowCount
				and: [ self value columnCount = self magritteDescription columnCount ]) ifFalse: [
					self value: (self value
						copyRows: self magritteDescription rowCount
						columns: self magritteDescription columnCount) ] ].
	^ self value
]

{ #category : #accessing }
MATableComponent >> descriptionTable [
	^ descriptionTable ifNil: [ descriptionTable := self buildDescriptionTable ]
]

{ #category : #testing }
MATableComponent >> hasLabelId [
	^ true
]

{ #category : #private }
MATableComponent >> readUsing: aDescription [
	^ self dataTable
		at: (aDescription propertyAt: #row)
		at: (aDescription propertyAt: #column)
]

{ #category : #rendering }
MATableComponent >> renderViewerOn: html [ 
	html table
		id: self labelId;
		with: 
			[ html tableRow: 
				[ html tableHeading: nil.
				self magritteDescription columnLabels do: [ :each | html tableHeading: each ] ].
			self magritteDescription rowLabels keysAndValuesDo: 
				[ :rindex :row | 
				html tableRow: 
					[ html tableHeading: row.
					self magritteDescription columnLabels keysAndValuesDo: 
						[ :cindex :col | 
						html tableData: (self componentTable 
								uncheckedAt: rindex
								at: cindex) ] ] ] ]
]

{ #category : #private }
MATableComponent >> write: anObject using: aDescription [
	^ self dataTable
		at: (aDescription propertyAt: #row)
		at: (aDescription propertyAt: #column)
		put: anObject
]
