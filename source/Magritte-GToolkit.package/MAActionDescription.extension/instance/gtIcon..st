*Magritte-GToolkit
gtIcon: formValuable
	self propertyAt: #gtIcon put: formValuable.
	"Implementation note: Store as a valuable so that potentially expensive form creation can be deferred until use. Use property instead of inst var because:
		- we can scope this to GToolkit as an extension method
		- It seems to fit with the 'instVar=mandatory, prop=optional' guideline"