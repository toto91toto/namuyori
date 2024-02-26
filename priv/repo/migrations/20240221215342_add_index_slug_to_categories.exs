defmodule Namuyori.Repo.Migrations.AddIndexSlugToCategories do
  use Ecto.Migration

  def change do
    create unique_index(:categories, [:slug])
  end
end
