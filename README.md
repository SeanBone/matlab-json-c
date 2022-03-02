# JSON+C parsing for MATLAB

[![View matlab-json-c on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://ch.mathworks.com/matlabcentral/fileexchange/107465-matlab-json-c)

This package offers some simple functions to handle JSON+C (JSON with comments) in a MATLAB script.

 - `jsonc.removeJSONComments` removes JavaScript-style comments from the string (or char array) you give it as argument.
 - `jsonc.jsoncDecode` is a wrapper for MATLAB's native `jsondecode`. It filters the string you give it though `jsonc.removeJSONComments` before passing it to `jsondecode`.
 - `jsonc.jsonEncode` is a wrapper for MATLAB's native `jsonencode`. This tries to use the `PrettyPrint` option if it is supported (which depends on your MATLAB version).

The `demo.m` script shows example usage.

    >> demo
    Original string:
    {
    	// One-line comment
    	"foo": "bar", // One-line comment at end of line
    	/*
    		Multiline comment
    	*/
    	"singleLinerInString": "//",
    	"multilinerInString": "/*",
    	"*/": "baz"
    }

    String without comments:
    {
    
    	"foo": "bar", 
    
    	"singleLinerInString": "//",
    	"multilinerInString": "/*",
    	"*/": "baz"
    }


    recoveredData = 

      struct with fields:

                        foo: 'bar'
        singleLinerInString: '//'
         multilinerInString: '/*'
                        x__: 'baz'

    Data re-encoded to JSON:
    {
      "foo": "bar",
      "singleLinerInString": "//",
      "multilinerInString": "/*",
      "x__": "baz"
    }

## But why?
The JSON standard does not allow for comments. However, it is often convenient to allow for them when using JSON as a markup language for configuration files and the likes. Hence the need for the not-quite-official JSON+C variant.

Although there is already a similar implementation on the [MATLAB file exchange](https://ch.mathworks.com/matlabcentral/fileexchange/71249-matlab_jsonc?s_tid=srchtitle), that relies on an external JSON parser and requires you to compile it with MEX for your target platform(s). This is a much more lightweight alternative implemented in "vanilla" MATLAB.
