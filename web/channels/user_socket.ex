defmodule Koalog.UserSocket do
  use Phoenix.Socket

  ## Channels
  channel "comments:*", Koalog.CommentChannel

  ## Transports
  transport :websocket, Phoenix.Transports.WebSocket, timeout: 45_000
  # transport :longpoll, Phoenix.Transports.LongPoll

  def connect(%{"token" => token}, socket) do
    case Phoenix.Token.verify(socket, "user", token, max_age: 1209600) do
      {:ok, user_id} ->
        {:ok, assign(socket, :user, user_id)}
      {:error, reason} ->
        {:ok, socket}
    end
  end

  # Socket id's are topics that allow you to identify all sockets for a given user:
  #
  #     def id(socket), do: "users_socket:#{socket.assigns.user_id}"
  #
  # Would allow you to broadcast a "disconnect" event and terminate
  # all active sockets and channels for a given user:
  #
  #     Koalog.Endpoint.broadcast("users_socket:#{user.id}", "disconnect", %{})
  #
  # Returning `nil` makes this socket anonymous.
  def id(_socket), do: nil
end
