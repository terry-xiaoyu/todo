-module(todo_prv).

-export([init/1, do/1, format_error/1]).

-define(PROVIDER, todo).
-define(DEPS, [app_discovery]).

%% ===================================================================
%% Public API
%% ===================================================================
-spec init(rebar_state:t()) -> {ok, rebar_state:t()}.
init(State) ->
    Provider = providers:create([
            {name, ?PROVIDER},            % The 'user friendly' name of the task
            {module, ?MODULE},            % The module implementation of the task
            {bare, true},                 % The task can be run by the user, always true
            {deps, ?DEPS},                % The list of dependencies
            {example, "rebar3 todo"},     % How to use the plugin
            {opts, [                      % list of options understood by the plugin
                {deps, $d, "deps", main_project, "also run against dependencies"}
            ]},
            {short_desc, "Reports TODOs in source code"},
            {desc, "Scans top-level application source and reports "
                   "instance of 'TODO:' lines in comments."
            }
    ]),
    {ok, rebar_state:add_provider(State, Provider)}.


-spec do(rebar_state:t()) -> {ok, rebar_state:t()} | {error, string()}.
do(State) ->
    Apps = rebar_state:project_apps(State),
    rebar_api:error("All apps: ~p", [Apps]),
    {ok, State}.

-spec format_error(any()) ->  iolist().
format_error(Reason) ->
    io_lib:format("~p", [Reason]).
