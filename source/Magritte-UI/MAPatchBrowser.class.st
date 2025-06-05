Class {
	#name : 'MAPatchBrowser',
	#superclass : 'SpPresenter',
	#category : 'Magritte-UI'
}

{ #category : 'building' }
MAPatchBrowser >> compose [ 
	self tabulator with: [ :browser |
		"self configureBrowser: browser."
		self composeBrowserOn: browser  ]
]

{ #category : 'building' }
MAPatchBrowser >> composeBrowserOn: browser [
	browser
		row: #tree;
		row: #diff.

	browser transmit 
		to: #tree; 
 		andShow: [ :a |
			a fastTree 
				children: #children ].
	browser transmit to: #diff; from: #tree; andShow: [ :a | 
		a diff
			display: [ :op | op diffStrings ] ]
]
