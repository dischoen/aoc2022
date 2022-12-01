%%%-------------------------------------------------------------------
%%% @author Dieter Schoen <dieter@schoen.or.at>
%%% @copyright (C) 2022, Dieter Schoen
%%% @doc
%%%
%%% @end
%%% Created :  1 Dec 2022 by Dieter Schoen <dieter@schoen.or.at>
%%%-------------------------------------------------------------------
-module(day1).

%% API
-export([try0/0]).

%%%===================================================================
%%% API
%%%===================================================================

%%--------------------------------------------------------------------
%% @doc
%% @spec
%% @end
%%--------------------------------------------------------------------

%%%===================================================================
%%% Internal functions
%%%===================================================================
try0() ->
    {ok, Data} = file:read_file("data/day1/data"),
    Strings = string:split(Data, "\n\n", all),
    Numbers = lists:map(fun(X) -> 
                           lists:map(fun(Y) -> 
                                             binary_to_integer(Y)
                                     end,
                                     string:split(X, "\n", all)) 
                   end, 
                   Strings),
    
    Sums = lists:map(fun(Ni) -> lists:sum(Ni) end, Numbers),
    Max = lists:max(Sums),
    Index = find_max(Max, Sums, 1),
    {Max, Index, Sums}.
                    
find_max(Max, [Max|List], Idx) ->
    Idx;
find_max(Max, [_|List], Idx) ->
    find_max(Max, List, Idx + 1);
find_max(Max, [], Idx) ->
    -1.
    
    
    
