defmodule RumblWeb.SessionController do
  use RumblWeb, :controller

  def new(conn, _params) do
    render(conn, :new)
  end

  def create(conn, %{"session" => %{"username" => username, "password" => password}}) do
    case Rumbl.Accounts.authenticate_by_user_and_pass(username, password) do
      {:ok, user} ->
        conn
        |> RumblWeb.Auth.login(user)
        |> put_flash(:info, "Anmeldung erfolgreich")
        |> redirect(to: ~p"/")

      {:error, _reason} ->
        conn
        |> put_flash(:error, "Anmeldung fehlgeschlagen")
        |> render(:new)
    end
  end

  def delete(conn, _params) do
    conn
    |> RumblWeb.Auth.logout()
    |> put_flash(:info, "Abmeldung erfolgreich")
    |> redirect(to: ~p"/")
  end
end
