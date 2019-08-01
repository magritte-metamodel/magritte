rendering
render: aMagrittePresentation
	scrollPane := GeneralScrollPane new.
	scrollPane changeScrollerTableLayout.
	scrollPane scrollTarget: (self magritteMorphFrom: aMagrittePresentation).
	scrollPane layoutFrame: (LayoutFrame identity bottomOffset: 25).

	aMagrittePresentation when: GLMPresentationUpdated send: #actOnPresentationUpdated: to: self.
	^ scrollPane