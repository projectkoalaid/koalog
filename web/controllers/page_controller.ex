defmodule Koalog.PageController do
  use Koalog.Web, :controller

	plug :put_layout, "recipes.html"

	alias Koalog.Post

  def index(conn, _params) do
  	featured_posts = Post.featured(4) |> Repo.all |> Repo.preload([:user])
  	conn
  	|> assign(:css, "/css/recipe.css")
  	# |> assign(:css, "http://css01.media-allrecipes.com/assets/deployables/v-1.45.0.2674/main-css.bundled.Css")
  	|> render("index.html", featured_posts: featured_posts)
  end
end
