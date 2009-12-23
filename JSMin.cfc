<!-----------------------------------------------------------------------
********************************************************************************
Copyright 2009 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
www.coldboxframework.com | www.luismajano.com | www.ortussolutions.com
********************************************************************************

Author 	 :	Luis Majano
Description :

This is a plugin that interfaces with our own flavor of JSMin to minify
css and js files.

Configuration Settings Needed:

jsmin_enable : boolean (true) 
	- flag to enable disable the packaging process
jsmin_cacheLocation : string 
	- the absolute file location where cached minified js/css files will be stored
jsmin_urllocation : string
	- the path to use when including the js/css from the cache location
	
----------------------------------------------------------------------->
<cfcomponent hint="This is a plugin that interfaces with our own flavor of JSMin to minify css and js files."
			 extends="coldbox.system.Plugin"
			 output="false"
			 singleton="true">

<!------------------------------------------- CONSTRUCTOR ------------------------------------------->

	<cffunction name="init" access="public" returntype="JSMin" output="false" hint="Constructor.">
		<!--- ************************************************************* --->
		<cfargument name="controller" type="any" required="true" hint="coldbox.system.web.Controller">
		<!--- ************************************************************* --->
		<cfscript>
			super.Init(arguments.controller);
			
			setpluginName("JSMin");
			setpluginVersion("1.0");
			setpluginDescription("A plugin that minifies js/css files");
			setpluginAuthor("Luis Majano");
			setpluginAuthorURL("http://www.coldbox.org");
			
			return this;
		</cfscript>			
	</cffunction>

<!------------------------------------------- PUBLIC ------------------------------------------->

	

</cfcomponent>