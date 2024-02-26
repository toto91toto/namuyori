defmodule Namuyori.RecipesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Namuyori.Recipes` context.
  """

  @doc """
  Generate a category.
  """
  def category_fixture(attrs \\ %{}) do
    {:ok, category} =
      attrs
      |> Enum.into(%{
        description: "some description",
        slug: "some slug",
        title: "some title"
      })
      |> Namuyori.Recipes.create_category()

    category
  end
end
