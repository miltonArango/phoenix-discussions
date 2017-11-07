defmodule Discuss.CommentsChannel do
    @moduledoc """
    Provides the implementation of the `join/3` and `handle_in/3` functions
    required for the web socket.
    """
    
    use Discuss.Web, :channel

    alias Discuss.{Topic, Comment}

    def join("comments:" <> topic_id, _params, socket) do
        topic_id = String.to_integer(topic_id)
        topic = 
            Topic 
            |> Repo.get(topic_id)
            |> Repo.preload(comments: [:user])
        {:ok, %{comments: topic.comments}, assign(socket, :topic, topic)}
    end

    def handle_in(name, %{"content" => content}, socket) do
        topic = socket.assigns.topic
        user_id = socket.assigns.user_id

        changeset = 
            topic
            |> build_assoc(:comments, user_id: user_id)
            |> Comment.changeset(%{content: content})

        case Repo.insert(changeset) do
            {:ok, comment} -> 
                broadcast!(socket, "comments:#{socket.assigns.topic.id}:new", %{comment: comment})
                {:reply, :ok, socket}
            {:error, _reason} ->
                {:reply, {:error, %{errors: changeset}}, socket}
            _ -> 
                "[ERROR] An unexpected error has presented."
        end
    end

end
