defmodule RumblWeb.UserHTML do
  @moduledoc """
  This module contains pages rendered by UserController.

  See the `user_html` directory for all templates available.
  """
  alias Rumbl.Accounts
  use RumblWeb, :html

  embed_templates "user_html/*"

  @doc """
  Extrahiert den Vornamen aus dem vollständigen Namen eines Benutzers.
  """
  def first_name(%Accounts.User{name: name}) do
    name
    |> String.split(" ")
    |> Enum.at(0)
  end

  def first_name(_), do: "Unbekannt"

  def user_strong(assigns) do
    ~H"""
    <strong>
      <%= first_name(@user) %> (id: <%= @user.id %>)
    </strong>
    """
  end
end
