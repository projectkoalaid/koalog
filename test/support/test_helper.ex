defmodule Koalog.TestHelper do
  alias Koalog.Repo
  alias Koalog.User
  alias Koalog.Role
  alias Koalog.Post
  import Ecto, only: [build_assoc: 2]
  def create_role(%{name: name, admin: admin}) do
    Role.changeset(%Role{}, %{name: name, admin: admin})
    |> Repo.insert
  end

  def create_user(role, %{email: email, username: username, password: password, password_confirmation: password_confirmation}) do
    if user = Repo.get_by(User, username: username) do
      Repo.delete(user)
    end
    role
    |> build_assoc(:users)
    |> User.changeset(%{email: email, username: username, password: password, password_confirmation: password_confirmation})
    |> Repo.insert
  end

  def create_post(user, %{title: title, body: body}) do
    user
    |> build_assoc(:posts)
    |> Post.changeset(%{title: title, body: body})
    |> Repo.insert
  end
end