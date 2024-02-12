defmodule NamuyoriWeb.RecipeControllerTest do
  use NamuyoriWeb.ConnCase

  import Namuyori.DictionaryFixtures

  @create_attrs %{description: "some description", title: "some title", preparation_time: 42, cooking_time: 42, total_time: 42, dificulty_level: "some dificulty_level", url_image: "some url_image", url_video: "some url_video"}
  @update_attrs %{description: "some updated description", title: "some updated title", preparation_time: 43, cooking_time: 43, total_time: 43, dificulty_level: "some updated dificulty_level", url_image: "some updated url_image", url_video: "some updated url_video"}
  @invalid_attrs %{description: nil, title: nil, preparation_time: nil, cooking_time: nil, total_time: nil, dificulty_level: nil, url_image: nil, url_video: nil}

  describe "index" do
    test "lists all recipes", %{conn: conn} do
      conn = get(conn, ~p"/recipes")
      assert html_response(conn, 200) =~ "Listing Recipes"
    end
  end

  describe "new recipe" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/recipes/new")
      assert html_response(conn, 200) =~ "New Recipe"
    end
  end

  describe "create recipe" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/recipes", recipe: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/recipes/#{id}"

      conn = get(conn, ~p"/recipes/#{id}")
      assert html_response(conn, 200) =~ "Recipe #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/recipes", recipe: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Recipe"
    end
  end

  describe "edit recipe" do
    setup [:create_recipe]

    test "renders form for editing chosen recipe", %{conn: conn, recipe: recipe} do
      conn = get(conn, ~p"/recipes/#{recipe}/edit")
      assert html_response(conn, 200) =~ "Edit Recipe"
    end
  end

  describe "update recipe" do
    setup [:create_recipe]

    test "redirects when data is valid", %{conn: conn, recipe: recipe} do
      conn = put(conn, ~p"/recipes/#{recipe}", recipe: @update_attrs)
      assert redirected_to(conn) == ~p"/recipes/#{recipe}"

      conn = get(conn, ~p"/recipes/#{recipe}")
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, recipe: recipe} do
      conn = put(conn, ~p"/recipes/#{recipe}", recipe: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Recipe"
    end
  end

  describe "delete recipe" do
    setup [:create_recipe]

    test "deletes chosen recipe", %{conn: conn, recipe: recipe} do
      conn = delete(conn, ~p"/recipes/#{recipe}")
      assert redirected_to(conn) == ~p"/recipes"

      assert_error_sent 404, fn ->
        get(conn, ~p"/recipes/#{recipe}")
      end
    end
  end

  defp create_recipe(_) do
    recipe = recipe_fixture()
    %{recipe: recipe}
  end
end
