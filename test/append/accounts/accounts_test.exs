defmodule Append.AccountsTest do
  use Append.DataCase

  alias Append.Accounts

  describe "addresses" do
    alias Append.Accounts.Address

    @valid_attrs %{address_line_1: "some address_line_1", address_line_2: "some address_line_2", city: "some city", name: "some name", postcode: "some postcode", tel: "some tel"}
    @update_attrs %{address_line_1: "some updated address_line_1", address_line_2: "some updated address_line_2", city: "some updated city", name: "some updated name", postcode: "some updated postcode", tel: "some updated tel"}
    @invalid_attrs %{address_line_1: nil, address_line_2: nil, city: nil, name: nil, postcode: nil, tel: nil}

    def address_fixture(attrs \\ %{}) do
      {:ok, address} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_address()

      address
    end

    test "list_addresses/0 returns all addresses" do
      address = address_fixture()
      assert Accounts.list_addresses() == [address]
    end

    test "get_address!/1 returns the address with given id" do
      address = address_fixture()
      assert Accounts.get_address!(address.id) == address
    end

    test "create_address/1 with valid data creates a address" do
      assert {:ok, %Address{} = address} = Accounts.create_address(@valid_attrs)
      assert address.address_line_1 == "some address_line_1"
      assert address.address_line_2 == "some address_line_2"
      assert address.city == "some city"
      assert address.name == "some name"
      assert address.postcode == "some postcode"
      assert address.tel == "some tel"
    end

    test "create_address/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_address(@invalid_attrs)
    end

    test "update_address/2 with valid data updates the address" do
      address = address_fixture()
      assert {:ok, %Address{} = address} = Accounts.update_address(address, @update_attrs)
      assert address.address_line_1 == "some updated address_line_1"
      assert address.address_line_2 == "some updated address_line_2"
      assert address.city == "some updated city"
      assert address.name == "some updated name"
      assert address.postcode == "some updated postcode"
      assert address.tel == "some updated tel"
    end

    test "update_address/2 with invalid data returns error changeset" do
      address = address_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_address(address, @invalid_attrs)
      assert address == Accounts.get_address!(address.id)
    end

    test "delete_address/1 deletes the address" do
      address = address_fixture()
      assert {:ok, %Address{}} = Accounts.delete_address(address)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_address!(address.id) end
    end

    test "change_address/1 returns a address changeset" do
      address = address_fixture()
      assert %Ecto.Changeset{} = Accounts.change_address(address)
    end
  end
end
