defmodule Namuyori.DictionaryFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Namuyori.Dictionary` context.
  """

  @doc """
  Generate a recipe.
  """
  def recipe_fixture(attrs \\ %{}) do
    {:ok, recipe} =
      attrs
      |> Enum.into(%{
        cooking_time: 42,
        description: "some description",
        dificulty_level: "some dificulty_level",
        preparation_time: 42,
        title: "some title",
        total_time: 42,
        url_image: "some url_image",
        url_video: "some url_video"
      })
      |> Namuyori.Dictionary.create_recipe()

    recipe
  end
end
