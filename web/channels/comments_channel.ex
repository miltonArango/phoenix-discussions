defmodule Discuss.CommentsChannel do
    @moduledoc """
    Provides the implementation of the `join/3` and `handle_in/3` functions
    required for the web socket.
    """
    
    use Discuss.Web, :channel

    alias Discuss.Topic

    def join("comments:" <> topic_id, _params, socket) do
        topic_id = String.to_integer(topic_id)
        topic = Repo.get(Topic, topic_id)
        {:ok, %{}, socket}
    end

    def handle_in(name, message, socket) do
        {:reply, :ok, socket}
    end

end
