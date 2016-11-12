defmodule Koalog.Post do
  use Koalog.Web, :model

  schema "posts" do
    field :title, :string
    field :body, :string

    timestamps()

    belongs_to :user, Koalog.User
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :body])
    |> validate_required([:title, :body])
  end
end
