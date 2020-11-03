I am a visitor responsible for visiting Magritte descriptions. I am an abstract class providing a default implementation for concrete visitors.

My key entry point is #visit:, which starts the visiting process. Other visiting messages, like #visitAll:, send #visit: at some point.

In order to get from the generic #visit: to the #visitXyzDescription: message from my 'visiting-description' protocol that is appropriate for the object I'm visiting (e.g. #visitBooleanDescription:), a handshake is performed between me and that object using two double-dispatches. I send the object #acceptMagritte: with myself as argument. Each description type's acceptMagritte: method then sends the appropriate #visitXyzDescription: message back to me with itself as the argument.

My 'visiting-description' protocol reflects the hierarchy of *MADescription* and its subclasses. Visiting a class which my subclasses don't handle specifically automatically defaults to a less-specific implementation e.g. Boolean -> Element -> Description. This code, along with the corresponding #acceptMagritte: methods, was automatically created using code on my class-side.