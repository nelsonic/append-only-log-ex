defmodule Append.AddressTest do
  use Append.DataCase
  alias Append.Address

  test "add item to database" do
    assert {:ok, item} = Address.insert(%{
      name: "Thor",
      address_line_1: "The Hall",
      address_line_2: "Valhalla",
      city: "Asgard",
      postcode: "AS1 3DG",
      tel: "0800123123"
    })

    assert item.name == "Thor"
  end

  describe "get items from database" do
    test "get/1" do
      {:ok, item} = insert_address()

      assert Address.get(item.entry_id) == item
    end

    test "all/0" do
      {:ok, _item} = insert_address()
      {:ok, _item_2} = insert_address("Loki")

      assert length(Address.all()) == 2
    end
  end

  def insert_address(name \\ "Thor") do
    Address.insert(%{
      name: name,
      address_line_1: "The Hall",
      address_line_2: "Valhalla",
      city: "Asgard",
      postcode: "AS1 3DG",
      tel: "0800123123"
    })
  end

  test "update item in database" do
    {:ok, item} = insert_address()

    {:ok, updated_item} = Address.update(item, %{tel: "0123444444"})

    assert updated_item.name == item.name
    assert updated_item.tel != item.tel
  end


  test "get updated item" do
    {:ok, item} = insert_address()

    {:ok, updated_item} = Address.update(item, %{tel: "0123444444"})

    assert Address.get(item.entry_id) == updated_item
  end

  test "all/0 does not include old items" do
    {:ok, item} = insert_address()
    {:ok, _} = insert_address("Loki")
    {:ok, _} = Address.update(item, %{postcode: "W2 3EC"})

    assert length(Address.all()) == 2
  end
end
