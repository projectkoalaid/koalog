defmodule Koalog.Post do
  use Koalog.Web, :model

  schema "posts" do
    field :title, :string
    field :body, :string

    timestamps()

    belongs_to :user, Koalog.User
    has_many :comments, Koalog.Comment
  end

  def featured(n) do
    from p in Koalog.Post,
      left_join: c in Koalog.Comment, on: c.post_id == p.id and c.approved,
      group_by: p.id,
      order_by: [desc: count(c.id), desc: p.id],
      limit: ^n
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :body])
    |> validate_required([:title, :body])
    # |> strip_unsafe_body(params)
    |> validate_featured_image
  end

  defp validate_featured_image(changeset) do
    body = get_field(changeset, :body)
    case extract_featured_image(body) do
      %{"url" => _} -> changeset
      _ -> add_error(changeset, :body, "Need to have featured image")
    end
  end

  defp extract_featured_image(body) when is_nil(body), do: nil

  defp extract_featured_image(body) do
    Regex.named_captures(~r/!\[.*?\]\((?<url>.*?)\)/, body)
  end

  defp strip_unsafe_body(model, %{"body" => nil}) do
    model
  end

  defp strip_unsafe_body(model, %{"body" => body}) do
    {:safe, clean_body} = Phoenix.HTML.html_escape(body)
    model |> put_change(:body, clean_body)
  end

  defp strip_unsafe_body(model, _) do
    model
  end
end
