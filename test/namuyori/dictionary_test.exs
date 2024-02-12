defmodule Namuyori.DictionaryTest do
  use Namuyori.DataCase

  alias Namuyori.Dictionary

  describe "recipes" do
    alias Namuyori.Dictionary.Recipe

    import Namuyori.DictionaryFixtures

    @invalid_attrs %{description: nil, title: nil, preparation_time: nil, cooking_time: nil, total_time: nil, dificulty_level: nil, url_image: nil, url_video: nil}

    test "list_recipes/0 returns all recipes" do
      recipe = recipe_fixture()
      assert Dictionary.list_recipes() == [recipe]
    end

    test "get_recipe!/1 returns the recipe with given id" do
      recipe = recipe_fixture()
      assert Dictionary.get_recipe!(recipe.id) == recipe
    end

    test "create_recipe/1 with valid data creates a recipe" do
      valid_attrs = %{description: "some description", title: "some title", preparation_time: 42, cooking_time: 42, total_time: 42, dificulty_level: "some dificulty_level", url_image: "some url_image", url_video: "some url_video"}

      assert {:ok, %Recipe{} = recipe} = Dictionary.create_recipe(valid_attrs)
      assert recipe.description == "some description"
      assert recipe.title == "some title"
      assert recipe.preparation_time == 42
      assert recipe.cooking_time == 42
      assert recipe.total_time == 42
      assert recipe.dificulty_level == "some dificulty_level"
      assert recipe.url_image == "some url_image"
      assert recipe.url_video == "some url_video"
    end

    test "create_recipe/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Dictionary.create_recipe(@invalid_attrs)
    end

    test "update_recipe/2 with valid data updates the recipe" do
      recipe = recipe_fixture()
      update_attrs = %{description: "some updated description", title: "some updated title", preparation_time: 43, cooking_time: 43, total_time: 43, dificulty_level: "some updated dificulty_level", url_image: "some updated url_image", url_video: "some updated url_video"}

      assert {:ok, %Recipe{} = recipe} = Dictionary.update_recipe(recipe, update_attrs)
      assert recipe.description == "some updated description"
      assert recipe.title == "some updated title"
      assert recipe.preparation_time == 43
      assert recipe.cooking_time == 43
      assert recipe.total_time == 43
      assert recipe.dificulty_level == "some updated dificulty_level"
      assert recipe.url_image == "some updated url_image"
      assert recipe.url_video == "some updated url_video"
    end

    test "update_recipe/2 with invalid data returns error changeset" do
      recipe = recipe_fixture()
      assert {:error, %Ecto.Changeset{}} = Dictionary.update_recipe(recipe, @invalid_attrs)
      assert recipe == Dictionary.get_recipe!(recipe.id)
    end

    test "delete_recipe/1 deletes the recipe" do
      recipe = recipe_fixture()
      assert {:ok, %Recipe{}} = Dictionary.delete_recipe(recipe)
      assert_raise Ecto.NoResultsError, fn -> Dictionary.get_recipe!(recipe.id) end
    end

    test "change_recipe/1 returns a recipe changeset" do
      recipe = recipe_fixture()
      assert %Ecto.Changeset{} = Dictionary.change_recipe(recipe)
    end
  end
end
