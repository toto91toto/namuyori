defmodule Namuyori.CookingRecipesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Namuyori.CookingRecipes` context.
  """

  @doc """
  Generate a category.
  """
  def category_fixture(attrs \\ %{}) do
    {:ok, category} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Namuyori.CookingRecipes.create_category()

    category
  end
end
