-module(beamjs_mod_console).
-export([exports/0]).
-include_lib("erlv8/include/erlv8.hrl").

exports() ->
	erlv8_object:new([{"log", fun log/2},{"info", fun log/2},{"warn", fun log/2},{"error", fun log/2},{"dir", fun log/2}]).
%% TODO: time, timeEnd, trace, assert

log(#erlv8_fun_invocation{ vm = VM } = _Invocation, [Expr]) ->
	io:format("~s~n",[beamjs_js_formatter:format(VM,Expr)]),
	undefined.

