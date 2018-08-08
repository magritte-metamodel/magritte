I dynamically build container descriptions from class-side methods using a simple naming convention for the selector names:

# The method ==#defaultContainer== is called to retrieve the container instance.
# All the unary methods starting with the selector ==#description== are called and should return a valid description to be added to the container.
# All the keyword messages with one argument having a prefix of a method selected in step 2 will be called with the original description to further refine its definition.