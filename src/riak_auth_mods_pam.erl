-module(riak_auth_mods_pam).

-export([auth/4]).

auth(Username, Password, _UserOptions, SourceOptions) ->
    P = canola:open(),
    Service = proplists:get_value("service", SourceOptions, "riak"),
    Res = canola:auth(list_to_binary(Username), list_to_binary(Password),
                list_to_binary(Service), P),
    canola:close(P),
    Res.
