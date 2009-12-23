Author 	 :	Luis Majano
Description :

This is a plugin that interfaces with our own flavor of JSMin to minify
css and js files.  It can also compress several files of the same type
into a single include.

Configuration Settings:

jsmin_enable : boolean (defaults to true)  
	- flag to enable disable the packaging process
jsmin_cacheLocation : string (REQUIRED)
	- the relative file location where cached minified js/css files will be stored,
	  this location will be expanded. ex: includes/cache	
	  
Usage:

* minify(assets:string) : html script or link

The main method of operation is minify().  You pass to it a list of assets to compress,
but they have to be of the same type: js or css.  Do not alternate or weird results will
happen.  This method returns a script or link include that you would output on your layouts:

<head>
#getMyPlugin("JSMin").minify('includes/js/myscripts.js','includes/js/jquery.js')#
#getMyPlugin("JSMin").minify('includes/css/site.css','includes/css/boxes.css')#
</head>

As you can see from the example above, you can easily render the minified version of all
the assets.  This plugin will minify each asset and if more than 1 is declared, then it
will build a concatenated version of the js or css assets and cache them.

* minifyToHead(assets:string) : void

This method basically sends the html links and script tags to the head section using
cfhtmlhead.  You can use this method when calling JSMin via handlers or plugins or any other
location than layouts.