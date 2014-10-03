-module(folgian).

-behaviour(cowboy_middleware).

-export([execute/2]).

execute(Req, Env) ->
    RawUUID = uuid:get_v4(),
    StringUUID =  uuid:uuid_to_string(RawUUID),
    UUID = list_to_binary(StringUUID),
    Header = application:get_env(folgian, header, <<"x-folgian-request-id">>),
    ok = add_metadata(folgian_request_id, UUID),
    Req2 = cowboy_req:set_resp_header(Header, UUID, Req),
    {ok, Req2, Env}.

add_metadata(Key, Value) ->
    Metadata = lager:md(),
    Metadata2 = lists:keystore(Key, 1, Metadata, {Key, Value}),
    lager:md(Metadata2).
