defmodule Koalog.PageView do
  use Koalog.Web, :view
  import Koalog.PostView, only: [featured_image: 1, snippet: 1]
end
