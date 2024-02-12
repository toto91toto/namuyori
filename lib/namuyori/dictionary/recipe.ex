defmodule Namuyori.Dictionary.Recipe do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "recipes" do
    field :description, :string
    field :title, :string
    field :preparation_time, :integer
    field :cooking_time, :integer
    field :total_time, :integer
    field :dificulty_level, :string
    field :url_image, :string
    field :url_video, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(recipe, attrs) do
    recipe
    |> cast(attrs, [:title, :description, :preparation_time, :cooking_time, :total_time, :dificulty_level, :url_image, :url_video])
    |> validate_required([:title, :description, :preparation_time, :cooking_time, :total_time, :dificulty_level, :url_image, :url_video])
  end
end
