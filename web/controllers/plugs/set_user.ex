defmodule Discuss.Plugs.SetUser do
    @moduledoc """
    Provides a plug to setting the user struct in the session.
    """
    import Plug.Conn
    import Phoenix.Controller

    alias Discuss.Repo
    alias Discuss.User
    alias Discuss.Router.Helpers


end