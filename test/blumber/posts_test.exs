defmodule Blumber.PostsTest do
  use Blumber.DataCase

  alias Blumber.Posts

  describe "posts" do
    alias Blumber.Posts.Post

    import Blumber.PostsFixtures

    @invalid_attrs %{status: nil, title: nil}

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert Posts.list_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert Posts.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      valid_attrs = %{status: 42, title: "some title"}

      assert {:ok, %Post{} = post} = Posts.create_post(valid_attrs)
      assert post.status == 42
      assert post.title == "some title"
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Posts.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()
      update_attrs = %{status: 43, title: "some updated title"}

      assert {:ok, %Post{} = post} = Posts.update_post(post, update_attrs)
      assert post.status == 43
      assert post.title == "some updated title"
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = Posts.update_post(post, @invalid_attrs)
      assert post == Posts.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = Posts.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> Posts.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = Posts.change_post(post)
    end
  end

  describe "post_versions" do
    alias Blumber.Posts.PostVersion

    import Blumber.PostsFixtures

    @invalid_attrs %{content: nil, version: nil}

    test "list_post_versions/0 returns all post_versions" do
      post_version = post_version_fixture()
      assert Posts.list_post_versions() == [post_version]
    end

    test "get_post_version!/1 returns the post_version with given id" do
      post_version = post_version_fixture()
      assert Posts.get_post_version!(post_version.id) == post_version
    end

    test "create_post_version/1 with valid data creates a post_version" do
      valid_attrs = %{content: "some content", version: 42}

      assert {:ok, %PostVersion{} = post_version} = Posts.create_post_version(valid_attrs)
      assert post_version.content == "some content"
      assert post_version.version == 42
    end

    test "create_post_version/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Posts.create_post_version(@invalid_attrs)
    end

    test "update_post_version/2 with valid data updates the post_version" do
      post_version = post_version_fixture()
      update_attrs = %{content: "some updated content", version: 43}

      assert {:ok, %PostVersion{} = post_version} = Posts.update_post_version(post_version, update_attrs)
      assert post_version.content == "some updated content"
      assert post_version.version == 43
    end

    test "update_post_version/2 with invalid data returns error changeset" do
      post_version = post_version_fixture()
      assert {:error, %Ecto.Changeset{}} = Posts.update_post_version(post_version, @invalid_attrs)
      assert post_version == Posts.get_post_version!(post_version.id)
    end

    test "delete_post_version/1 deletes the post_version" do
      post_version = post_version_fixture()
      assert {:ok, %PostVersion{}} = Posts.delete_post_version(post_version)
      assert_raise Ecto.NoResultsError, fn -> Posts.get_post_version!(post_version.id) end
    end

    test "change_post_version/1 returns a post_version changeset" do
      post_version = post_version_fixture()
      assert %Ecto.Changeset{} = Posts.change_post_version(post_version)
    end
  end
end
