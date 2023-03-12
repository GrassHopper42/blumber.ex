defmodule Blumber.Repo.Migrations.CreatePostVersions do
  use Ecto.Migration

  def change do
    create table(:post_versions, primary_key: false) do
      add :version, :integer, primary_key: true, default: 1
      add :content, :string, null: false
      add :post_id, references(:posts), primary_key: true

      timestamps(updated_at: false)
    end
  end
end
