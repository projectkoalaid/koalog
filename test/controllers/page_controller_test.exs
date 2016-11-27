defmodule Koalog.PageControllerTest do
  use Koalog.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Recommended for you"
    assert html_response(conn, 200) =~ "Project Koala - Konten Anak Lokal"
  end
end
