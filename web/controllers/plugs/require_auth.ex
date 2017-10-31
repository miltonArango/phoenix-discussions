defmodule Discuss.Plugs.RequireAuth do
    @moduledoc """
    Handles authorization permissons for the users. To control which actions they can perform.
    """
    import Plug.Conn
    import Phoenix.Controller

    alias Discuss.Router.Helpers

    def init(_params) do
        # Blank initialization method
    end

    def call(conn, _params) do
        if conn.assigns[:user] do
            conn
        else
            conn
            |> put_flash(:error, "You must be logged in")
            |> redirect(to: Helpers.topic_path(conn, :index))
            |> halt()
        end 
    end

end