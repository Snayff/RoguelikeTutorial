/// @desc log( values )
/// @param values
/// @param [...]

var _string = "";

for  (var _i = 0; _i < argument_count; _i++ ) {
    _string = _string + string( argument[ _i ] );
}

show_debug_message( _string );