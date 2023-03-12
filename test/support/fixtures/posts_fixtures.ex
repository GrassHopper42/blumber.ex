defmodule Blumber.PostsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Blumber.Posts` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        status: 42,
        title: "some title"
      })
      |> Blumber.Posts.create_post()

    post
  end

  @doc """
  Generate a post_version.
  """
  def post_version_fixture(attrs \\ %{}) do
    {:ok, post_version} =
      attrs
      |> Enum.into(%{
        content: "some content",
        version: 42
      })
      |> Blumber.Posts.create_post_version()

    post_version
  end
end
