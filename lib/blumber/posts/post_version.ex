defmodule Blumber.Posts.PostVersion do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  schema "post_versions" do
    field :content, :string
    field :version, :integer, primary_key: true
    belongs_to :post, Blumber.Posts.Post, primary_key: true, references: :id

    timestamps(updated_at: false)
  end

  @doc false
  def changeset(post_version, attrs) do
    post_version
    |> cast(attrs, [:version, :content])
    |> validate_required([:version, :content])
  end

  @doc false
  def version_changeset(post_version, attrs) do
    post_version
    |> cast(attrs, [:version])
    |> validate_required([:version])
    |> validate_number(:version, greater_than_or_equal_to: 1)
  end

  def content_changeset(post_version, attrs) do
    post_version
    |> cast(attrs, [:content])
    |> validate_required([:content])
  end

  def create_changeset(post_version, attrs) do
    post_version
    |> cast(attrs, [:version, :content])
    |> validate_required([:version, :content])
    |> validate_number(:version, greater_than_or_equal_to: 1)
  end
end
