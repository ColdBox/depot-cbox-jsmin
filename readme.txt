Author 	 :	Luis Majano
Description :

This is a plugin that interfaces with our own flavor of JSMin to minify
CSS and JavaScript files and also compress them into a single include file.  We
have also added LESS support for compiling LESS into CSS for you or on-demand.


Configuration Settings:

jsmin_enable : boolean (defaults to true)  
	- flag to enable disable the packaging process
jsmin_cacheLocation : string
	- the relative file location where cached minified js/css files will be stored,
	  this location will be expanded. ex: includes/cache

If any of the minify methods cannot find a location argument or the jsmin_cacheLocation setting
then an exception will be thrown.
	 
Usage:

* minify(assets:string, location:relativePath) : html script or link

The main method of operation is minify().  You pass to it a list of assets to compress,
but they have to be of the same type: js or css/less.  Do not alternate or weird results will
happen.  This method returns a script or link include that you would output on your layouts:

<head>
#getMyPlugin("JSMin").minify('includes/js/myscripts.js,includes/js/jquery.js')#
#getMyPlugin("JSMin").minify('includes/css/site.css,includes/css/boxes.css')#
#getMyPlugin("JSMin").minify('includes/css/site.less,includes/css/boxes.less')#

// With Location
#getMyPlugin("JSMin").minify(assets='includes/css/site.less,includes/css/boxes.less',
							 location='includes/mycache')#
</head>

As you can see from the example above, you can easily render the minified version of all
the assets.  This plugin will minify each asset and if more than 1 is declared, then it
will build a concatenated version of the js or css/less assets and cache them. If the files
are of LESS extension, then the plugin will compile the LESS into CSS files.

You can use the alternate 'location' argument to choose the location of the compressed and 
minified files.

* minifyToHead(assets:string, location:relativePath) : void

This method basically sends the HTML links and script tags to the head section using
cfhtmlhead.  You can use this method when calling JSMin via handlers or plugins or any other
location than layouts.

* compileLessSource(input:LESS, [ output:absolutePath ]) : CSS
This method compiles LESS source into CSS for you and returns it to you if no output argument is used, 
else the compiled source is sent to the output file. An extra goody about this method is that 
compilation only takes place if the source LESS file has been modified.

* compileLess(input:absolutePath, [ output:absolutePath ]) : [void | CSS]

This methods can compile an input LESS file into an output CSS file or you can omit passing 
the output file argument and the method will return to you the compiled CSS.

======================================================================
CHANGELOG
======================================================================

Version 4.0
# Updated the LESS library to use lesscss-java instead as the other library did not allow for relative imports.

Version 3.1
# Fixed locking issues when generating cached files under high load

Version 3.0
# Fixes for responsive design
# Added capabilities for LESS compilation
# Auto-detection of LESS files in minify
# ColdFusion 9 and above only

Version 2.0
# Update of java libraries
# Fixes for media queries via CF as it was easier than in the java parser
# Fixes for \ demarcators in javascript, it now removes them and compresses the line 

Vesion 1.7
# Addition of fixes to complex css patterns like input[type="button"] p, basically anything in closing brackets

Version 1.6
# Oops fixes

Version 1.5

# Added ability to store files without using a UUID so they can survive fwreinits and load balancing
  thanks to Scott ColdWell
# Updated to use StringBuilder instead of Buffer.
# Fixing of empty first line

Version 1.4

# Updates to core java processor to add more funky css definitions via commenting system in css and js.

Version 1.3

# Updates to core java processor to add more funky css definitions

Version 1.2

# Fixes to trimming incoming assets

Version 1.1

# Updates to core java processor to distinguish between css and js compression
# Fixed negative margin issues with css compression
# Fixed advanced spaced selectors with css compression

Version 1.0

# Initial Release