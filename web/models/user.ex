defmodule Discuss.User do
    @moduledoc """
    Model that represent an User inside the database.
    """

    use Discuss.Web, :model

    schema "users" do
        field :email, :string
        field :provider, :string
        field :token, :string

        timestamps()
    end 

    def changeset(struct, params \\ %{}) do
        struct
        |> cast(params, [:email, :provider, :token])
        |> validate_required([:email, :provider, :token])
    end
end