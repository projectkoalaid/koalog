defmodule Koalog.PostViewTest do
  use Koalog.ConnCase, async: true

  test "converts markdown to html" do
    {:safe, result} = Koalog.PostView.markdown("**bold me**")
    assert String.contains? result, "<strong>bold me</strong>"
  end

  test "leaves text with no markdown alone" do
    {:safe, result} = Koalog.PostView.markdown("leave me alone")
    assert String.contains? result, "leave me alone"
  end

  test "extract image url from post body" do
    result = Koalog.PostView.featured_image("![Embun](http://image.com/abc)")
    assert String.contains? result, "http://image.com/abc"
  end

  test "featured image is nil not defined in body" do
    result = Koalog.PostView.featured_image("leave me alone")
    assert is_nil result
  end


end