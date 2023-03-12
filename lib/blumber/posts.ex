defmodule Blumber.Posts do
  @moduledoc """
  The Posts context.
  """

  import Ecto.Query, warn: false
  alias Blumber.Repo

  alias Blumber.Posts.Post

  @doc """
  Returns the list of posts.

  ## Examples

      iex> list_posts()
      [%Post{}, ...]

  """
  def list_posts do
    Repo.all(Post)
  end

  @doc """
  Gets a single post.

  Raises `Ecto.NoResultsError` if the Post does not exist.

  ## Examples

      iex> get_post!(123)
      %Post{}

      iex> get_post!(456)
      ** (Ecto.NoResultsError)

  """
  def get_post!(id), do: Repo.get!(Post, id)

  @doc """
  Creates a post.

  ## Examples

      iex> create_post(%{field: value})
      {:ok, %Post{}}

      iex> create_post(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_post(attrs \\ %{}) do
    %Post{}
    |> Post.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a post.

  ## Examples

      iex> update_post(post, %{field: new_value})
      {:ok, %Post{}}

      iex> update_post(post, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_post(%Post{} = post, attrs) do
    post
    |> Post.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a post.

  ## Examples

      iex> delete_post(post)
      {:ok, %Post{}}

      iex> delete_post(post)
      {:error, %Ecto.Changeset{}}

  """
  def delete_post(%Post{} = post) do
    Repo.delete(post)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking post changes.

  ## Examples

      iex> change_post(post)
      %Ecto.Changeset{data: %Post{}}

  """
  def change_post(%Post{} = post, attrs \\ %{}) do
    Post.changeset(post, attrs)
  end

  alias Blumber.Posts.PostVersion

  @doc """
  Returns the list of post_versions.

  ## Examples

      iex> list_post_versions()
      [%PostVersion{}, ...]

  """
  def list_post_versions do
    Repo.all(PostVersion)
  end

  @doc """
  Gets a single post_version.

  Raises `Ecto.NoResultsError` if the Post version does not exist.

  ## Examples

      iex> get_post_version!(123)
      %PostVersion{}

      iex> get_post_version!(456)
      ** (Ecto.NoResultsError)

  """
  def get_post_version!(id), do: Repo.get!(PostVersion, id)

  def get_last_post_version!(post_id) do
    Repo.one(
      from pv in PostVersion,
      where: pv.post_id == ^post_id,
      order_by: [desc: pv.version],
      limit: 1
    )
  end

  @doc """
  Creates a post_version.

  ## Examples

      iex> create_post_version(%{field: value})
      {:ok, %PostVersion{}}

      iex> create_post_version(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_post_version(attrs \\ %{}) do
    %PostVersion{}
    |> PostVersion.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a post_version.

  ## Examples

      iex> update_post_version(post_version, %{field: new_value})
      {:ok, %PostVersion{}}

      iex> update_post_version(post_version, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_post_version(%PostVersion{} = post_version, attrs) do
    post_version
    |> PostVersion.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a post_version.

  ## Examples

      iex> delete_post_version(post_version)
      {:ok, %PostVersion{}}

      iex> delete_post_version(post_version)
      {:error, %Ecto.Changeset{}}

  """
  def delete_post_version(%PostVersion{} = post_version) do
    Repo.delete(post_version)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking post_version changes.

  ## Examples

      iex> change_post_version(post_version)
      %Ecto.Changeset{data: %PostVersion{}}

  """
  def change_post_version(%PostVersion{} = post_version, attrs \\ %{}) do
    PostVersion.changeset(post_version, attrs)
  end
end
