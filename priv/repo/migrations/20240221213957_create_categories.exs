defmodule Namuyori.Repo.Migrations.CreateCategories do
  use Ecto.Migration

  def change do
    create table(:categories, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :title, :string
      add :slug, :string
      add :description, :text

      timestamps(type: :utc_datetime)
    end
  end
end
