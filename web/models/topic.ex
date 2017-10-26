defmodule Discuss.Topic do
    @moduledoc """
    Model that represents a Topic in the database.
    """

    use Discuss.Web, :model

    schema "topics" do
        field :title, :string
    end

    def changeset(struct, params \\ %{}) do
        struct
        |> cast(params, [:title])
        |> validate_required([:title])
    end
end
