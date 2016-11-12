defmodule Koalog.PageController do
  use Koalog.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
