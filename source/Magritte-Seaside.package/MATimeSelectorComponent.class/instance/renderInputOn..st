rendering
renderInputOn: html
	html timeInput
		withSeconds;
		value: self value;
		callback: [ :value | self value: value ]