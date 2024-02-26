defmodule Namuyori.RecipesTest do
  use Namuyori.DataCase

  alias Namuyori.Recipes

  describe "categories" do
    alias Namuyori.Recipes.Category

    import Namuyori.RecipesFixtures

    @invalid_attrs %{description: nil, title: nil, slug: nil}

    test "list_categories/0 returns all categories" do
      category = category_fixture()
      assert Recipes.list_categories() == [category]
    end

    test "get_category!/1 returns the category with given id" do
      category = category_fixture()
      assert Recipes.get_category!(category.id) == category
    end

    test "create_category/1 with valid data creates a category" do
      valid_attrs = %{description: "some description", title: "some title", slug: "some slug"}

      assert {:ok, %Category{} = category} = Recipes.create_category(valid_attrs)
      assert category.description == "some description"
      assert category.title == "some title"
      assert category.slug == "some slug"
    end

    test "create_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Recipes.create_category(@invalid_attrs)
    end

    test "update_category/2 with valid data updates the category" do
      category = category_fixture()
      update_attrs = %{description: "some updated description", title: "some updated title", slug: "some updated slug"}

      assert {:ok, %Category{} = category} = Recipes.update_category(category, update_attrs)
      assert category.description == "some updated description"
      assert category.title == "some updated title"
      assert category.slug == "some updated slug"
    end

    test "update_category/2 with invalid data returns error changeset" do
      category = category_fixture()
      assert {:error, %Ecto.Changeset{}} = Recipes.update_category(category, @invalid_attrs)
      assert category == Recipes.get_category!(category.id)
    end

    test "delete_category/1 deletes the category" do
      category = category_fixture()
      assert {:ok, %Category{}} = Recipes.delete_category(category)
      assert_raise Ecto.NoResultsError, fn -> Recipes.get_category!(category.id) end
    end

    test "change_category/1 returns a category changeset" do
      category = category_fixture()
      assert %Ecto.Changeset{} = Recipes.change_category(category)
    end
  end
end
