if(arguments.length === 0) {
	print("expected filename command line argument");
	exit();
}

var src = "";
var i;
for(i = 0; i < arguments.length; ++i)
{
	src = src + readFile(arguments[i]);
}

load("tools/jslint/fulljslint.js")
JSLINT(src);

var w;
var e = JSLINT.errors;
var errors = 0;
for (var i = 0; i < e.length; ++i) {
	w = e[i];
	if(!(w.reason !== null && w.reason === "Expected an identifier and instead saw 'undefined' (a reserved word).")) {
		print( "\n" + w.evidence + "\n");
		print("    Problem at line " + w.line + " character " + w.character + ": " + w.reason);
		++errors;
	}
}

if(errors !== 0)  {
	print("JSLint has " + errors + " errors");
} else {
	print("JSLint passed");
}


