I dynamically build container descriptions from instance-side methods decorated pragmas. The pragmas used are:
# ==#magritteContainer== to identify the method generating the container instance.
# ==#magritteDescription== for unary methods returning valid Magritte descriptions which are added to the container.
# ==#magritteDescription:== for single parameter methods returning Magritte description extensions, where the pragma parameter defines the related Magritte description method. The extension method will be called after the related method to refine the description definition.