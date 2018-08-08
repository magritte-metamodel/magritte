rendering
renderButtonsOn: html
	html div class: 'buttons'; with: [
		self buttons do: [ :each |
			html submitButton
				accessKey: each value first;
				callback: [ self execute: each key ];
				text: each value ] ]