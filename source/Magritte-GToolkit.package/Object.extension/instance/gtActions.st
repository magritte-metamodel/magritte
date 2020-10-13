*Magritte-GToolkit
gtActions
	"Hack to extend GToolkit's actions. The GT mechanism is in ProtoObject, which is the only class we miss by hooking in here"
	^ super gtActions, self magritteGToolkitActions