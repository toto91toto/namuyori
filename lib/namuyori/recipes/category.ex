defmodule Namuyori.Recipes.Category.TitleSlug do
  use EctoAutoslugField.Slug, from: :title, to: :slug
end

defmodule Namuyori.Recipes.Category do
  use Ecto.Schema
  import Ecto.Changeset
  alias Namuyori.Recipes.Category.TitleSlug

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  @derive {Phoenix.Param, key: :slug}
  schema "categories" do
    field :description, :string
    field :title, :string
    field :slug, TitleSlug.Type

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:title, :slug, :description])
    |> validate_required([:title, :slug, :description])
    |> unique_constraint(:title)
    |> TitleSlug.maybe_generate_slug()
    |> TitleSlug.unique_constraint()
  end
end
