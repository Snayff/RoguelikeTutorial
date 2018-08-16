/// @desc Convert value to string and show in dbeug
/// @param {any} val Value to show
/// @param [...]
/// example use: scDebugMsg("Log this", msgText)
var _string = "";

for  (var _i = 0; _i < argument_count; _i++ ) {
    _string = _string + string( argument[ _i ] );
}

show_debug_message( _string );