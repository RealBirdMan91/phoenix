defmodule Rumbl.AccountsTest do
  use Rumbl.DataCase, async: true

  alias Rumbl.Accounts
  alias Rumbl.Accounts.User

  describe "register_user/1" do
    @valid_attrs %{name: "John Doe", username: "johndoe", password: "supersecret"}
    @invalid_attrs %{}

    test "with valid data insert user" do
    end
  end
end
