I manage the file-data I represent on the file-system. From the programmer this looks the same as if the file would be in memory (==*MAMemoryFileModel*==), as it is transparently loaded and written out as necessary.

- The ==#baseDirectory== is the place where Magritte puts its file-database. Keep this value to nil to make it default to a subdirectory next to the Squeak image.
- The ==#baseUrl== is a nice optimization to allow Apache (or any other Web Server) to directly serve the files. ==#baseUrl== is an absolute URL-prefix that is used to generate the path to the file. If you have specified one the file data does not go trough the image anymore, but instead is directly served trough the properly configured Web Server.

The files are currently stored using the following scheme:

=/files/9d/bsy8kyp45g0q7blphknk48zujap2wd/earthmap1k.jpg
=1     2   3                              4

#Is the #baseDirectory as specified in the settings.
#Are 256 directories named '00' to 'ff' to avoid having thousands of files in the same directory. Unfortunately this leads to problems with the Squeak file primitives and some filesystems don't handle that well. This part is generated at random.
#This is a secure id, similar to the Seaside session key. It is generated at random and provides a security system that even works trough Apache (you have to disable directory listings of course): if you don't know the file-name you cannot access the file.
#This is the original file-name. Subclasses might want to store other cached versions of the same file there, for example resized images, etc.