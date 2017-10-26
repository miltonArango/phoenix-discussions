defmodule Discuss.Plugs.SetUser do
    @moduledoc """
    Provides a plug to setting the user struct in the session.
    """
    import Plug.Conn
    import Phoenix.Controller

    alias Discuss.Repo
    alias Discuss.User

    def init(_params) do
        # No initialization required for this plug.
    end

    def call(conn, _params) do
        user_id = get_session(conn, :user_id)

        if user = user_id && Repo.get(User, user_id) do
            assign(conn, :user, user)
        else
            assign(conn, :user, nil)
        end
        
    end

end