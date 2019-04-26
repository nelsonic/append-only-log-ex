defmodule Append.AddressTest do
  use Append.DataCase
  alias Append.Accounts.Address

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

  # describe "get items from database" do
  #   test "get/1" do
  #     {:ok, item} = insert_address()

  #     assert Address.get(item.entry_id) == item
  #   end

  #   test "all/0" do
  #     {:ok, _item} = insert_address()
  #     {:ok, _item_2} = insert_address("Loki")

  #     assert length(Address.all()) == 2
  #   end
  # end

  # def insert_address(name \\ "Thor") do
  #   Address.insert(%{
  #     name: name,
  #     address_line_1: "The Hall",
  #     address_line_2: "Valhalla",
  #     city: "Asgard",
  #     postcode: "AS1 3DG",
  #     tel: "0800123123"
  #   })
  # end

  # test "update item in database" do
  #   {:ok, item} = insert_address()

  #   {:ok, updated_item} = Address.update(item, %{tel: "0123444444"})

  #   assert updated_item.name == item.name
  #   assert updated_item.tel != item.tel
  # end


  # test "get updated item" do
  #   {:ok, item} = insert_address()

  #   {:ok, updated_item} = Address.update(item, %{tel: "0123444444"})

  #   assert Address.get(item.entry_id) == updated_item
  # end

  # test "all/0 does not include old items" do
  #   {:ok, item} = insert_address()
  #   {:ok, _} = insert_address("Loki")
  #   {:ok, _} = Address.update(item, %{postcode: "W2 3EC"})

  #   assert length(Address.all()) == 2
  # end

  # test "get history of item" do
  #   {:ok, item} = insert_address()
  #   # IO.inspect item

  #   {:ok, updated_item} = Address.update(item, %{
  #     address_line_1: "12",
  #     address_line_2: "Kvadraturen",
  #     city: "Oslo",
  #     postcode: "NW1 SCA",
  #   })

  #   history = Address.get_history(updated_item)

  #   assert length(history) == 2
  #   assert [h1, h2] = history
  #   assert h1.city == "Asgard"
  #   assert h2.city == "Oslo"
  # end

  # describe "delete:" do
  #   test "deleted items are not retrieved with 'get'" do
  #     {:ok, item} = insert_address()
  #     {:ok, _} = Address.delete(item)

  #     assert Address.get(item.entry_id) == nil
  #   end

  #   test "deleted items are not retrieved with 'all'" do
  #     {:ok, item} = insert_address()
  #     {:ok, _} = Address.delete(item)

  #     assert length(Address.all()) == 0
  #   end
  # end
end
