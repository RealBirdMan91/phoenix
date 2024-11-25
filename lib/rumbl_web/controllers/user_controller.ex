defmodule RumblWeb.UserController do
  use RumblWeb, :controller
  alias Rumbl.Accounts
  alias Rumbl.Accounts.User

  plug :authenticate_user when action in [:index, :show]

  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, :index, users: users)
  end

  def show(conn, %{"id" => id}) do
    {id_int, _} = Integer.parse(id)
    user = Accounts.get_user(id_int)
    render(conn, :show, user: user)
  end

  def new(conn, _params) do
    changeset = Accounts.change_registration(%User{}, %{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    case Accounts.register_user(user_params) do
      {:ok, user} ->
        conn
        |> RumblWeb.Auth.login(user)
        |> put_flash(:info, "User created successfully.")
        |> redirect(to: ~p"/users/#{user}")

      {:error, changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end
end
