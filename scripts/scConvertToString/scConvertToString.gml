/// @desc Convert value to string and return
/// @param {any} val Value to show
/// @param [...]
/// example use: scDebugMsg("Log this", msgText)
var _string = "";

for  (var _i = 0; _i < argument_count; _i++ ) {
    _string = _string + string( argument[ _i ] );
}
return _string;