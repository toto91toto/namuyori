defmodule NamuyoriWeb.RecipeController do
  use NamuyoriWeb, :controller

  alias Namuyori.Dictionary
  alias Namuyori.Dictionary.Recipe

  def index(conn, _params) do
    recipes = Dictionary.list_recipes()
    render(conn, :index, recipes: recipes)
  end

  def new(conn, _params) do
    changeset = Dictionary.change_recipe(%Recipe{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"recipe" => recipe_params}) do
    case Dictionary.create_recipe(recipe_params) do
      {:ok, recipe} ->
        conn
        |> put_flash(:info, "Recipe created successfully.")
        |> redirect(to: ~p"/recipes/#{recipe}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    recipe = Dictionary.get_recipe!(id)
    render(conn, :show, recipe: recipe)
  end

  def edit(conn, %{"id" => id}) do
    recipe = Dictionary.get_recipe!(id)
    changeset = Dictionary.change_recipe(recipe)
    render(conn, :edit, recipe: recipe, changeset: changeset)
  end

  def update(conn, %{"id" => id, "recipe" => recipe_params}) do
    recipe = Dictionary.get_recipe!(id)

    case Dictionary.update_recipe(recipe, recipe_params) do
      {:ok, recipe} ->
        conn
        |> put_flash(:info, "Recipe updated successfully.")
        |> redirect(to: ~p"/recipes/#{recipe}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, recipe: recipe, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    recipe = Dictionary.get_recipe!(id)
    {:ok, _recipe} = Dictionary.delete_recipe(recipe)

    conn
    |> put_flash(:info, "Recipe deleted successfully.")
    |> redirect(to: ~p"/recipes")
  end
end
