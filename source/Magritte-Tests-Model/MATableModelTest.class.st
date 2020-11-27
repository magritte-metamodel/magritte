Class {
	#name : #MATableModelTest,
	#superclass : #TestCase,
	#instVars : [
		'table'
	],
	#category : 'Magritte-Tests-Model-Models'
}

{ #category : #running }
MATableModelTest >> setUp [
	table := (MATableModel rows: 3 columns: 4)
		collect: [ :row :col :value | row raisedTo: col ]
]

{ #category : #'tests-accessing' }
MATableModelTest >> testAtAt [
	self assert: (table at: 1 at: 1) = 1.
	self assert: (table at: 2 at: 3) = 8.
	self assert: (table at: 3 at: 2) = 9.
	self assert: (table at: 3 at: 4) = 81
]

{ #category : #'tests-accessing' }
MATableModelTest >> testAtAtAbsent [
	self should: [ table at: 0 at: 1 ] raise: Error.
	self should: [ table at: 1 at: 0 ] raise: Error.
	self should: [ table at: 4 at: 4 ] raise: Error.
	self should: [ table at: 3 at: 5 ] raise: Error
]

{ #category : #'tests-accessing' }
MATableModelTest >> testAtAtPut [
	self assert: (table at: 1 at: 1 put: -1) = -1.
	self assert: (table at: 2 at: 3 put: -8) = -8.
	self assert: (table at: 3 at: 2 put: -9) = -9.
	self assert: (table at: 3 at: 4 put: -81) = -81.

	self assert: (table at: 1 at: 1) = -1.
	self assert: (table at: 2 at: 3) = -8.
	self assert: (table at: 3 at: 2) = -9.
	self assert: (table at: 3 at: 4) = -81
]

{ #category : #'tests-accessing' }
MATableModelTest >> testAtAtPutAbsent [
	self should: [ table at: 0 at: 1 put: 0 ] raise: Error.
	self should: [ table at: 1 at: 0 put: 0 ] raise: Error.
	self should: [ table at: 4 at: 4 put: 0 ] raise: Error.
	self should: [ table at: 3 at: 5 put: 0 ] raise: Error
]

{ #category : #'tests-enumerating' }
MATableModelTest >> testCollect [
	table := table collect: [ :row :col :val | row + col + val ].
	table do: [ :row :col :val | self assert: (row raisedTo: col) = (val - row - col) ]
]

{ #category : #'tests-accessing' }
MATableModelTest >> testContents [
	self assert: table contents = #( 1 1 1 1 2 4 8 16 3 9 27 81 )
]

{ #category : #'tests-copying' }
MATableModelTest >> testCopy [
	self assert: table copy rowCount = table rowCount.
	self assert: table copy columnCount = table columnCount.
	self assert: table copy contents = table contents.
	self deny: table copy contents == table contents
]

{ #category : #'tests-copying' }
MATableModelTest >> testCopyEmpty [
	self assert: table copyEmpty rowCount = table rowCount.
	self assert: table copyEmpty columnCount = table columnCount.
	self assert: (table copyEmpty contents allSatisfy: [ :each | each isNil ])
]

{ #category : #'tests-copying' }
MATableModelTest >> testCopyRowsColumns [
	self assert: (table copyRows: 1 columns: 2) rowCount = 1.
	self assert: (table copyRows: 1 columns: 2) columnCount = 2.
	self assert: (table copyRows: 1 columns: 2) contents = #(1 1).

	self assert: (table copyRows: 4 columns: 3) rowCount = 4.
	self assert: (table copyRows: 4 columns: 3) columnCount = 3.
	self assert: (table copyRows: 4 columns: 3) contents = #(1 1 1 2 4 8 3 9 27 nil nil nil)
]

{ #category : #'tests-accessing' }
MATableModelTest >> testCoumnCount [
	self assert: table columnCount = 4
]

{ #category : #'tests-enumerating' }
MATableModelTest >> testDo [
	table do: [ :row :col :val | self assert: (row raisedTo: col) = val ]
]

{ #category : #'tests-comparing' }
MATableModelTest >> testEqual [
	self assert: table = table.
	self assert: table = table copy.
	self assert: table copy = table.
	self assert: table copy = table copy.

	self deny: table = (table copy at: 1 at: 2 put: 3).
	self deny: table = (table copyRows: 3 columns: 3).
	self deny: table = (table copyRows: 4 columns: 4)
]

{ #category : #'tests-comparing' }
MATableModelTest >> testHash [
	self assert: table hash = table hash.
	self assert: table hash = table copy hash.
	self assert: table copy hash = table hash.
	self assert: table copy hash = table copy hash
]

{ #category : #'tests-accessing' }
MATableModelTest >> testRowCount [
	self assert: table rowCount = 3
]

{ #category : #tests }
MATableModelTest >> testSetup [
	self assert: table rowCount = 3.
	self assert: table columnCount = 4.
	self assert: table contents = #( 1 1 1 1 2 4 8 16 3 9 27 81 )
]
