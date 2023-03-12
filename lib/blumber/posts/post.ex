defmodule Blumber.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :status, :integer
    field :title, :string
    belongs_to :user, Blumber.Accounts.User
    has_many :post_versions, Blumber.Posts.PostVersion

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :status])
    |> validate_required([:title, :status])
  end

  def title_changeset(post, attrs) do
    post
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end

  def status_changeset(post, attrs) do
    post
    |> cast(attrs, [:status])
    |> validate_required([:status])
    |> validate_inclusion(:status, [0, 1, 2])
  end
end
