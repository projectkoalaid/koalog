defmodule Koalog.Factory do
  use ExMachina.Ecto, repo: Koalog.Repo

  alias Koalog.Role
  alias Koalog.User
  alias Koalog.Post

  def role_factory do
    %Role{
      name: sequence(:name, &"Test Role #{&1}"),
      admin: false
    }
  end

  def user_factory do
    %User{
      username: sequence(:username, &"User #{&1}"),
      email: "test@test.com",
      password: "test1234",
      password_confirmation: "test1234",
      password_digest: Comeonin.Bcrypt.hashpwsalt("test1234"),
      role: build(:role)
    }
  end

  def post_factory do
    %Post{
      title: "Some Post",
      body: "And the body of some post",
      user: build(:user)
    }
  end
end