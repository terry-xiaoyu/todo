todo
=====

A rebar plugin

Build
-----

    $ rebar3 compile

Use
---

Add the plugin to your rebar config:

    {plugins, [
        {todo, {git, "https://host/user/todo.git", {tag, "0.1.0"}}}
    ]}.

Then just call your plugin directly in an existing application:


    $ rebar3 todo
    ===> Fetching todo
    ===> Compiling todo
    <Plugin Output>
