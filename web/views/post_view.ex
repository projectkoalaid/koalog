defmodule Koalog.PostView do
  use Koalog.Web, :view

  def markdown(body) do
    body
    |> Earmark.to_html
    |> raw
  end

  def featured_image(body) do
  	case Regex.named_captures(~r/!\[.*?\]\((?<url>.*?)\)/, body) do
  		%{"url" => url} -> url
  		_ -> nil
  	end
  end
end
