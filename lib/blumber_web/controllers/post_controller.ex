defmodule BlumberWeb.PostController do
  use BlumberWeb, :controller

  def post(conn, _params) do
    render(conn, :index)
  end
end
