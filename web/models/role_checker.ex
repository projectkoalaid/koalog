defmodule Koalog.RoleChecker do
  alias Koalog.Repo
  alias Koalog.Role

  def is_admin?(user) do
    (role = Repo.get(Role, user.role_id)) && role.admin
  end
end