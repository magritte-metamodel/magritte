Class {
	#name : #MAReport,
	#superclass : #MAComponent,
	#instVars : [
		'rows',
		'cache',
		'columns',
		'properties',
		'backtracked'
	],
	#category : 'Magritte-Seaside-Report'
}

{ #category : #testing }
MAReport class >> isAbstract [
	^ false
]

{ #category : #'instance creation' }
MAReport class >> rows: aCollection [
	^ self new
		rows: aCollection;
		yourself
]

{ #category : #'instance creation' }
MAReport class >> rows: aCollection description: aDescription [
	| report |
	report := self rows: aCollection.
	aDescription asContainer do: [ :each |
		report addColumnDescription: each ].
	^ report
]

{ #category : #columns }
MAReport >> addColumn: aColumn [
	columns := columns copyWith: aColumn.
	^ aColumn setReport: self; yourself
]

{ #category : #columns }
MAReport >> addColumnCascade: anArray [
	^ (self addColumn: MAColumn new)
		accessor: anArray;
		yourself
]

{ #category : #columns }
MAReport >> addColumnDescription: aDescription [
	^ self addColumn: (aDescription reportColumnClass new
		magritteDescription: aDescription;
		yourself)
]

{ #category : #columns }
MAReport >> addColumnSelector: aSelector [
	^ (self addColumn: MAColumn new)
		selector: aSelector;
		yourself
]

{ #category : #'private-batch' }
MAReport >> batchEndIndex [
	^ self batchPage * self batchSize min: self cache size
]

{ #category : #'private-batch' }
MAReport >> batchMaxPages [
	^ (self cache size / self batchSize)
		ceiling
]

{ #category : #'accessing-settings' }
MAReport >> batchPage [
	^ backtracked at: #batchPage ifAbsentPut: [ self defaultBatchPage ]
]

{ #category : #'accessing-settings' }
MAReport >> batchPage: anInteger [
	backtracked at: #batchPage put: anInteger
]

{ #category : #'private-batch' }
MAReport >> batchPageRange [
	^ self batchPageRangeStart to: self batchPageRangeEnd
]

{ #category : #'private-batch' }
MAReport >> batchPageRangeEnd [
	^ self batchMaxPages min: self batchPage + 9
]

{ #category : #'private-batch' }
MAReport >> batchPageRangeStart [
	^ self defaultBatchPage max: self batchPage - 9
]

{ #category : #'accessing-settings' }
MAReport >> batchSize [
	^ properties at: #batchSize ifAbsent: [ self defaultBatchSize ]
]

{ #category : #'accessing-settings' }
MAReport >> batchSize: anInteger [
	properties at: #batchSize put: anInteger
]

{ #category : #'private-batch' }
MAReport >> batchStartIndex [
	^ (self batchPage - 1) * self batchSize + 1
]

{ #category : #'accessing-readonly' }
MAReport >> cache [
	"Return the cached rows of the receiver, these rows are filtered and sorted."

	cache isNil ifTrue: [
		self cache: (self
			sortRows: (self
				filterRows: self
					rows asArray)) ].
	^ cache
]

{ #category : #'accessing-readonly' }
MAReport >> cache: aCollection [
	cache := aCollection
]

{ #category : #'accessing-readonly' }
MAReport >> columns [
	^ columns
]

{ #category : #'accessing-readonly' }
MAReport >> columns: aCollection [
	columns := aCollection
]

{ #category : #'accessing-defaults' }
MAReport >> defaultBatchPage [
	^ 1
]

{ #category : #'accessing-defaults' }
MAReport >> defaultBatchSize [
	^ 10
]

{ #category : #'accessing-defaults' }
MAReport >> defaultRowFilter [
	^ nil
]

{ #category : #'accessing-defaults' }
MAReport >> defaultRowPeriod [
	^ 1
]

{ #category : #'accessing-defaults' }
MAReport >> defaultRowStyles [
	^ Array with: 'odd' with: 'even'
]

{ #category : #'accessing-defaults' }
MAReport >> defaultShowBatch [
	^ true
]

{ #category : #'accessing-defaults' }
MAReport >> defaultShowBatchFirstLast [
	^ false
]

{ #category : #'accessing-defaults' }
MAReport >> defaultShowBatchPages [
	^ true
]

{ #category : #'accessing-defaults' }
MAReport >> defaultShowBatchPreviousNext [
	^ true
]

{ #category : #'accessing-defaults' }
MAReport >> defaultShowBody [
	^ true
]

{ #category : #'accessing-defaults' }
MAReport >> defaultShowCaption [
	^ false
]

{ #category : #'accessing-defaults' }
MAReport >> defaultShowFilter [
	^ false
]

{ #category : #'accessing-defaults' }
MAReport >> defaultShowFooter [
	^ false
]

{ #category : #'accessing-defaults' }
MAReport >> defaultShowHeader [
	^ true
]

{ #category : #'accessing-defaults' }
MAReport >> defaultShowSummary [
	^ false
]

{ #category : #'accessing-defaults' }
MAReport >> defaultSortColumn [
	^ nil
]

{ #category : #'accessing-defaults' }
MAReport >> defaultSortEnabled [
	^ true
]

{ #category : #'accessing-defaults' }
MAReport >> defaultSortReversed [
	^ false
]

{ #category : #'accessing-defaults' }
MAReport >> defaultSorterStyles [
	^ Array with: 'ascending' with: 'descending'
]

{ #category : #'accessing-defaults' }
MAReport >> defaultTableCaption [
	^ nil
]

{ #category : #'accessing-defaults' }
MAReport >> defaultTableEmpty [
	^ 'The report is empty.'
]

{ #category : #'accessing-defaults' }
MAReport >> defaultTableSummary [
	^ nil
]

{ #category : #exporting }
MAReport >> export [
	^ String streamContents: [ :stream |
		self exportOn: stream ]
]

{ #category : #exporting }
MAReport >> exportBodyOn: aStream [
	self cache keysAndValuesDo: [ :index :row |
		self visibleColumns
			do: [ :column |
				column
					exportContent: (column valueFor: row)
					index: index on: aStream ]
			separatedBy: [ aStream tab ].
		aStream nextPut: Character cr ]
]

{ #category : #exporting }
MAReport >> exportHeaderOn: aStream [
	self visibleColumns
		do: [ :each | each exportHeadOn: aStream ]
		separatedBy: [ aStream tab ].
	aStream nextPut: Character cr
]

{ #category : #exporting }
MAReport >> exportOn: aStream [
	self showHeader
		ifTrue: [ self exportHeaderOn: aStream ].
	self showBody
		ifTrue: [ self exportBodyOn: aStream ]
]

{ #category : #private }
MAReport >> filterRows: aCollection [
	| filters filter |
	filters := OrderedCollection new.
	self hasRowFilter
		ifTrue: [ filters add: self rowFilter ].
	self columns do: [ :each |
		each isFiltered ifTrue: [
			filter := each filterBlock.
			filter isNil
				ifFalse: [ filters add: filter ] ] ].
	^ filters isEmpty
		ifTrue: [ aCollection ]
		ifFalse: [ aCollection select: [ :row | filters allSatisfy: [ :block | block value: row ] ] ]
]

{ #category : #testing }
MAReport >> hasMoreThanOnePage [
	^self batchSize < self cache size
]

{ #category : #testing }
MAReport >> hasRowFilter [
	^ self rowFilter notNil
]

{ #category : #initialization }
MAReport >> initialize [
	super initialize.
	rows := columns := Array new.
	properties := Dictionary new.
	backtracked := Dictionary new
]

{ #category : #'private-batch' }
MAReport >> isOnFirstPage [
	^ self batchPage = 1
]

{ #category : #'private-batch' }
MAReport >> isOnLastPage [
	^ self batchPage = self batchMaxPages
]

{ #category : #testing }
MAReport >> isSorted [
	^ self sortColumn notNil
]

{ #category : #columns }
MAReport >> moveDown: aColumn [
	| index |
	index := self columns indexOf: aColumn ifAbsent: [ ^ self ].
	self columns swap: index with: (index = self size
		ifFalse:[ index + 1 ]
		ifTrue: [ 1 ])
]

{ #category : #columns }
MAReport >> moveUp: aColumn [
	| index |
	index := self columns indexOf: aColumn ifAbsent: [ ^ self ].
	self columns swap: index with: (index = 1
		ifFalse:[ index - 1 ]
		ifTrue: [ self size ])
]

{ #category : #actions }
MAReport >> nextPage [
	self isOnLastPage
		ifFalse: [ self batchPage: self batchPage + 1 ]
]

{ #category : #actions }
MAReport >> previousPage [
	self isOnFirstPage
		ifFalse: [ self batchPage: self batchPage - 1 ]
]

{ #category : #actions }
MAReport >> refresh [
	self cache: nil; batchPage: self defaultBatchPage.
	self columns do: [ :each | each refresh ]
]

{ #category : #columns }
MAReport >> remove: aColumn [
	columns := columns copyWithout: aColumn
]

{ #category : #'rendering-batch' }
MAReport >> renderBatchFirstOn: html [
	self isOnFirstPage
		ifFalse: [ html anchor callback: [ self batchPage: self defaultBatchPage ]; with: '|<' ]
		ifTrue: [ html text: '|<' ].
	html space
]

{ #category : #'rendering-batch' }
MAReport >> renderBatchItemsOn: html [
	self batchPageRangeStart > self defaultBatchPage
		ifTrue: [ html text: '...'; space ].
	self batchPageRange do: [ :index |
		self batchPage = index
			ifFalse: [ html anchor callback: [ self batchPage: index ]; with: index ]
			ifTrue: [ html span class: 'current'; with: index ].
		html space ].
	self batchPageRangeEnd < (self batchMaxPages - 1)
		ifTrue: [ html text: '...'; space ].
	self batchPageRangeEnd = self batchMaxPages
		ifFalse: [
			html anchor
				callback: [ self batchPage: self batchMaxPages ];
				with: self batchMaxPages ]
]

{ #category : #'rendering-batch' }
MAReport >> renderBatchLastOn: html [
	self isOnLastPage
		ifFalse: [ html anchor callback: [ self batchPage: self batchMaxPages ]; with: '>|' ]
		ifTrue: [ html text: '>|' ]
]

{ #category : #'rendering-batch' }
MAReport >> renderBatchNextOn: html [
	self isOnLastPage
		ifFalse: [ html anchor callback: [ self nextPage ]; with: '>>' ]
		ifTrue: [ html text: '>>' ].
	html space
]

{ #category : #'rendering-batch' }
MAReport >> renderBatchPreviousOn: html [
	self isOnFirstPage
		ifFalse: [ html anchor callback: [ self previousPage ]; with: '<<' ]
		ifTrue: [ html text: '<<' ].
	html space
]

{ #category : #rendering }
MAReport >> renderContentOn: html [
	html table
		id: self ajaxId; class: 'report';
		with: [ self renderTableOn: html ]
]

{ #category : #'rendering-table' }
MAReport >> renderTableBatchOn: html [
	self hasMoreThanOnePage ifTrue: [
		html tableRow: [
			html tableData
				class: 'batch';
				colSpan: self visibleColumns size;
				with: [
					self showBatchFirstLast
						ifTrue: [ self renderBatchFirstOn: html ].
					self showBatchPreviousNext
						ifTrue: [ self renderBatchPreviousOn: html ].
					self showBatchPages
						ifTrue: [ self renderBatchItemsOn: html ].
					self showBatchPreviousNext
						ifTrue: [ self renderBatchNextOn: html ].
					self showBatchFirstLast
						ifTrue: [ self renderBatchLastOn: html ] ] ] ]
]

{ #category : #'rendering-table' }
MAReport >> renderTableBodyOn: html [ 
	self visible isEmpty 
		ifTrue: [ 
			html tableRow
				class: 'empty';
				with: [ 
					html tableData
						colSpan: self visibleColumns size;
						with: self tableEmpty ] ]
		ifFalse: [
			self visible keysAndValuesDo: [ :index :row | 
				html tableRow
					class: (self rowStyleForNumber: index);
					with: [ 
						self visibleColumns do: [ :col | 
							col 
								renderCell: row
								index: index
								on: html ] ] ] ]
]

{ #category : #'rendering-table' }
MAReport >> renderTableCaptionOn: html [
	(html tag: 'caption') with: self tableCaption
]

{ #category : #'rendering-table' }
MAReport >> renderTableFilterOn: html [
	html tableRow: [
		self visibleColumns do: [ :each |
			each renderFilterCellOn: html ] ]
]

{ #category : #'rendering-table' }
MAReport >> renderTableFootOn: html [
	html tableRow: [
		self visibleColumns do: [ :each |
			each renderFootCellOn: html ] ]
]

{ #category : #'rendering-table' }
MAReport >> renderTableHeadOn: html [
	html tableRow: [
		self visibleColumns do: [ :each |
			each renderHeadCellOn: html ] ]
]

{ #category : #rendering }
MAReport >> renderTableOn: html [
	self showCaption
		ifTrue: [ self renderTableCaptionOn: html ].
	self showSummary
		ifTrue: [ self renderTableSummaryOn: html ].
	html tableHead: [
		self showHeader
			ifTrue: [ self renderTableHeadOn: html ].
		self showFilter
			ifTrue: [ self renderTableFilterOn: html ] ].

	((self showBatch
		and: [ self hasMoreThanOnePage ])
		or: [ self showFooter ]) ifTrue: [
			"we must not produce an empty tfoot element, this is not valid xhtml"
			html tableFoot: [
				self showFooter
					ifTrue: [ self renderTableFootOn: html ].
				self showBatch
					ifTrue: [ self renderTableBatchOn: html ] ] ].

	html tableBody: [
		self showBody
			ifTrue: [ self renderTableBodyOn: html ] ]
]

{ #category : #'rendering-table' }
MAReport >> renderTableSummaryOn: html [
	(html tag: 'summary') with: self tableSummary
]

{ #category : #'accessing-settings' }
MAReport >> rowFilter [
	^ backtracked at: #rowFilter ifAbsent: [ self defaultRowFilter ]
]

{ #category : #'accessing-settings' }
MAReport >> rowFilter: aBlock [
	backtracked at: #rowFilter put: aBlock.
	self refresh
]

{ #category : #'accessing-settings' }
MAReport >> rowPeriod [
	^ properties at: #rowPeriod ifAbsent: [ self defaultRowPeriod ]
]

{ #category : #'accessing-settings' }
MAReport >> rowPeriod: aNumber [
	properties at: #rowPeriod put: aNumber
]

{ #category : #private }
MAReport >> rowStyleForNumber: aNumber [
	^ self rowStyles
		at: ((aNumber - 1 // self rowPeriod) \\ self rowStyles size) + 1
		ifAbsent: [ String new ]
]

{ #category : #'accessing-settings' }
MAReport >> rowStyles [
	^ properties at: #rowStyles ifAbsent: [ self defaultRowStyles ]
]

{ #category : #'accessing-settings' }
MAReport >> rowStyles: aCollection [
	properties at: #rowStyles put: aCollection
]

{ #category : #accessing }
MAReport >> rows [
	"Return the rows of the receiver."

	^ rows
]

{ #category : #accessing }
MAReport >> rows: aCollection [
	"Set the rows of the receiver."
	
	rows := aCollection ifNil: [ Array new ].
	self refresh
]

{ #category : #'accessing-settings' }
MAReport >> showBatch [
	^ properties at: #showBatch ifAbsent: [ self defaultShowBatch ]
]

{ #category : #'accessing-settings' }
MAReport >> showBatch: aBoolean [
	properties at: #showBatch put: aBoolean
]

{ #category : #'accessing-settings' }
MAReport >> showBatchFirstLast [
	^ properties at: #showBatchFirstLast ifAbsent: [ self defaultShowBatchFirstLast ]
]

{ #category : #'accessing-settings' }
MAReport >> showBatchFirstLast: aBoolean [
	properties at: #showBatchFirstLast put: aBoolean
]

{ #category : #'accessing-settings' }
MAReport >> showBatchPages [
	^ properties at: #showBatchPages ifAbsent: [ self defaultShowBatchPages ]
]

{ #category : #'accessing-settings' }
MAReport >> showBatchPages: aBoolean [
	properties at: #showBatchPages put: aBoolean
]

{ #category : #'accessing-settings' }
MAReport >> showBatchPreviousNext [
	^ properties at: #showBatchPreviousNext ifAbsent: [ self defaultShowBatchPreviousNext ]
]

{ #category : #'accessing-settings' }
MAReport >> showBatchPreviousNext: aBoolean [
	properties at: #showBatchPreviousNext put: aBoolean
]

{ #category : #'accessing-settings' }
MAReport >> showBody [
	^ properties at: #showBody ifAbsent: [ self defaultShowBody ]
]

{ #category : #'accessing-settings' }
MAReport >> showBody: aBoolean [
	properties at: #showBody put: aBoolean
]

{ #category : #'accessing-settings' }
MAReport >> showCaption [
	^ properties at: #showCaption ifAbsent: [ self defaultShowCaption ]
]

{ #category : #'accessing-settings' }
MAReport >> showCaption: aBoolean [
	properties at: #showCaption put: aBoolean
]

{ #category : #'accessing-settings' }
MAReport >> showFilter [
	^ properties at: #showFilter ifAbsent: [ self defaultShowFilter ]
]

{ #category : #'accessing-settings' }
MAReport >> showFilter: aBoolean [
	properties at: #showFilter put: aBoolean
]

{ #category : #'accessing-settings' }
MAReport >> showFooter [
	^ properties at: #showFooter ifAbsent: [ self defaultShowFooter ]
]

{ #category : #'accessing-settings' }
MAReport >> showFooter: aBoolean [
	properties at: #showFooter put: aBoolean
]

{ #category : #'accessing-settings' }
MAReport >> showHeader [
	^ properties at: #showHeader ifAbsent: [ self defaultShowHeader ]
]

{ #category : #'accessing-settings' }
MAReport >> showHeader: aBoolean [
	properties at: #showHeader put: aBoolean
]

{ #category : #'accessing-settings' }
MAReport >> showSummary [
	^ properties at: #showSummary ifAbsent: [ self defaultShowSummary ]
]

{ #category : #'accessing-settings' }
MAReport >> showSummary: aBoolean [
	properties at: #showSummary put: aBoolean
]

{ #category : #actions }
MAReport >> sort: aColumn [
	aColumn = self sortColumn
		ifTrue: [
			self sortReversed
				ifFalse: [ self sortReversed: true ]
				ifTrue: [ self sortColumn: nil; sortReversed: false ] ]
		ifFalse: [ self sortColumn: aColumn; sortReversed: false ].
	self refresh
]

{ #category : #'accessing-settings' }
MAReport >> sortColumn [
	^ backtracked at: #sortColumn ifAbsent: [ self defaultSortColumn ]
]

{ #category : #'accessing-settings' }
MAReport >> sortColumn: aColumn [
	backtracked at: #sortColumn put: aColumn
]

{ #category : #'accessing-settings' }
MAReport >> sortEnabled [
	^ properties at: #sortEnabled ifAbsent: [ self defaultSortEnabled ]
]

{ #category : #'accessing-settings' }
MAReport >> sortEnabled: aBoolean [
	properties at: #sortEnabled put: aBoolean
]

{ #category : #'accessing-settings' }
MAReport >> sortReversed [
	^ backtracked at: #sortReversed ifAbsent: [ self defaultSortReversed ]
]

{ #category : #'accessing-settings' }
MAReport >> sortReversed: aBoolean [
	backtracked at: #sortReversed put: aBoolean
]

{ #category : #private }
MAReport >> sortRows: aCollection [
	^ self isSorted
		ifFalse: [ aCollection ]
		ifTrue: [ self sortColumn sortRows: aCollection ]
]

{ #category : #'accessing-settings' }
MAReport >> sorterStyles [
	^ properties at: #sorterStyles ifAbsent: [ self defaultSorterStyles ]
]

{ #category : #'accessing-settings' }
MAReport >> sorterStyles: aCollection [
	properties at: #sorterStyles put: aCollection
]

{ #category : #'accessing-readonly' }
MAReport >> states [
	^ Array with: backtracked
]

{ #category : #'accessing-settings' }
MAReport >> tableCaption [
	^ properties at: #tableCaption ifAbsent: [ self defaultTableCaption ]
]

{ #category : #'accessing-settings' }
MAReport >> tableCaption: aString [
	properties at: #tableCaption put: aString
]

{ #category : #'accessing-settings' }
MAReport >> tableEmpty [
	^ properties at: #tableEmpty ifAbsent: [ self defaultTableEmpty ]
]

{ #category : #'accessing-settings' }
MAReport >> tableEmpty: aString [
	properties at: #tableEmpty put: aString
]

{ #category : #'accessing-settings' }
MAReport >> tableSummary [
	^ properties at: #tableSummary ifAbsent: [ self defaultTableSummary ]
]

{ #category : #'accessing-settings' }
MAReport >> tableSummary: aString [
	properties at: #tableSummary put: aString
]

{ #category : #'accessing-readonly' }
MAReport >> visible [
	^ self showBatch
		ifFalse: [ self cache ]
		ifTrue: [
			self cache
				copyFrom: self batchStartIndex
				to: self batchEndIndex ]
]

{ #category : #'accessing-readonly' }
MAReport >> visibleColumns [
	^ self columns select: [ :each | each isVisible ]
]
