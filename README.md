[![Build Status](https://travis-ci.org/magritte-metamodel/magritte.svg?branch=master)](https://travis-ci.org/magritte-metamodel/magritte)

Most applications consist of a big number of model- or so called domain-objects. Building different views, editors, and reports; querying, validating and storing those objects is very repetitive and error-prone, if an object changes its shape frequently.

Magritte is a fully dynamic meta-description framework that helps to solve those problems, while keeping the full power with the programmer in all aspects. Moreover since Magritte is described in itself, you can let your users modify the meta-world and add their own fields and forms without writing a single line of code.

### Installation
  * [Pharo Smalltalk](http://www.pharo.org/):
    * Pharo 6.x - 11.x: 
    ```smalltalk
    Metacello new
      baseline: 'Magritte';
      repository: 'github://magritte-metamodel/Magritte';
      load
       ```
    * Pharo 4.x: In the Configuration Browser (under [World Menu]->Tools), "Load Stable Version"
    * Previous versions: Load `ConfigurationOfMagritte3` from http://smalltalkhub.com/mc/Magritte/Magritte3/main/. 
  * [GemStone Smalltalk](http://seaside.gemstone.com/): Get the latest code from Gemstone repository at https://github.com/GsDevKit/Magritte3 .
  * [Cincom Smalltalk](http://www.cincomsmalltalk.com/): Load the bundle `MagritteForVisualWorks` from the Cincom public StORE.
  * [GNU Smalltalk](http://smalltalk.gnu.org/): An initial port is available through the the GNU Smalltalk git repository. 

Christoph Lamprecht ported Magritte to [Perl](http://sites.google.com/site/vlclamprecht/Home/perl).

### Add as a project dependency

In you project Baseline or Configuration definition, add to the spec:

```
baseline: 'Magritte' 
with: [ spec repository: 'github://magritte-metamodel/magritte:v3.8'; 
             loads: #(Core) ]; 
```

This snippet uses v3.8 release version, remember to change the release version to your needs. See BaselineOfMagritte for other groups to load beside of 'Core'.

### Mailing-Lists
  * [Magritte, Pier and Related Tools](https://www.iam.unibe.ch/mailman/listinfo/smallwiki)
  * [Seaside](http://lists.squeakfoundation.org/cgi-bin/mailman/listinfo/seaside)

### Development
  * [Code Repository](http://smalltalkhub.com/\#\!/~Magritte/Magritte3)
  * [Add-On Repository](http://smalltalkhub.com/\#\!/~Magritte/MagritteAddons)
  * [Report Issue](https://github.com/magritte-metamodel/magritte/issues)

### Documentation
  * [Magritte Chapter in Seaside Book](http://book.seaside.st/book/advanced/magritte)
  * [Using Magritte in Seaside](http://onsmalltalk.com/using-magritte-with-seaside)
  * Ongoing work: [A booklet on the Magritte the Meta Data-Driven Framework](https://github.com/SquareBracketAssociates/Booklet-Magritte)
  * [The Magritte Wiki](https://github.com/magritte-metamodel/magritte/wiki)
  
### Papers
  * [Magritte – Meta-Described Web Application Development](http://sdmeta.gforge.inria.fr/Teaching/Lille/0910-MetaModelisation/Magritte/Reng06a.pdf)
  * [Magritte – A Meta-Driven Approach to Empower Developers and End Users](http://scg.unibe.ch/archive/papers/Reng07aMagritte.pdf)
  
