<cfcomponent output="false" hint="My App Configuration">
<cfscript>
/**
structures to create for configuration

- coldbox
- settings
- conventions
- environments
- ioc
- models
- debugger
- mailSettings
- i18n
- bugTracers
- webservices
- datasources
- layoutSettings
- layouts
- cacheEngine
- interceptorSettings
- interceptors

Available objects in variable scope
- controller
- logBoxConfig
- appMapping (auto calculated by ColdBox)

Required Methods
- configure() : The method ColdBox calls to configure the application.
Optional Methods
- detectEnvironment() : If declared the framework will call it and it must return the name of the environment you are on.
- {environment}() : The name of the environment found and called by the framework.

*/
	
// Configure ColdBox Application
function configure(){

	// coldbox directives
	coldbox = {
		//Application Setup
		appName 				= "Compressor Sample",
		
		//Development Settings
		debugMode				= true,
		debugPassword			= "",
		reinitPassword			= "",
		handlersIndexAutoReload = true,
		
		//Implicit Events
		defaultEvent			= "general.index",
		requestStartHandler		= "",
		requestEndHandler		= "",
		applicationStartHandler = "",
		applicationEndHandler	= "",
		sessionStartHandler 	= "",
		sessionEndHandler		= "",
		missingTemplateHandler	= "",
		
		//Error/Exception Handling
		exceptionHandler		= "",
		onInvalidEvent			= "",
		customErrorTemplate		= "",
			
		//Application Aspects
		handlerCaching 			= false,
		eventCaching			= false
	};
	
	settings = {
		jsmin_enable = true,
		jsmin_cachelocation = "includes/cache"
	};
	
	// environment settings, create a detectEnvironment() method to detect it yourself.
	// create a function with the name of the environment so it can be executed if that environment is detected
	// the value of the environment is a list of regex patterns to match the cgi.http_host.
	environments = {
		//development = "^cf8.,^railo."
	};

	//Layout Settings
	layoutSettings = {
		defaultLayout = "Main.cfm"
	};
	
	//Register interceptors as an array, we need order
	interceptors = [
		 //Autowire
		 {class="coldbox.system.interceptors.Autowire"},
		 //SES
		 {class="coldbox.system.interceptors.SES"}
	];
	
}
	
</cfscript>
</cfcomponent>