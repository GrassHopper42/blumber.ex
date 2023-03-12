defmodule Blumber.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :status, :integer
      add :author_id, references(:users)

      timestamps()
    end

    create index(:posts, [:author_id])
  end
end
