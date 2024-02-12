defmodule Namuyori.Repo.Migrations.CreateRecipes do
  use Ecto.Migration

  def change do
    create table(:recipes, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :title, :string
      add :description, :text
      add :preparation_time, :integer
      add :cooking_time, :integer
      add :total_time, :integer
      add :dificulty_level, :string
      add :url_image, :string
      add :url_video, :string

      timestamps(type: :utc_datetime)
    end
  end
end
