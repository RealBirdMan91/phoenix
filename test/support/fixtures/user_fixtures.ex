defmodule Rumbl.UserFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Rumbl.User` context.
  """

  alias Rumbl.Accounts

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        name: "some name",
        username: "user#{System.unique_integer([:positive])}",
        password: attrs[:password] || "supersecret"
      })
      |> Accounts.create_user()

    user
  end
end
