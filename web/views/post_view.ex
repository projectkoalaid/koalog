defmodule Koalog.PostView do
  use Koalog.Web, :view

  def markdown(body) do
    body
    |> Earmark.to_html
    |> raw
  end
end
