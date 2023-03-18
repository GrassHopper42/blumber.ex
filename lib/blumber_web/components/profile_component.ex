defmodule BlumberWeb.ProfileComponent do
  use Phoenix.Component
  use BlumberWeb, :html

  attr :current_user, :map

  def auth(assigns) do
    ~H"""
    <ul class="relative z-10 flex items-center gap-4 px-4 sm:px-6 lg:px-8 justify-end">
      <%= if @current_user do %>
        <li class="text-[0.8125rem] leading-6 text-zinc-900">
          <.profile />
        </li>
        <li>
          <.button>
            <.link
              href={~p"/users/settings"}
              class="text-[0.8125rem] leading-6 text-zinc-900 font-semibold hover:text-zinc-700"
            >
              Settings
            </.link>
          </.button>
        </li>
        <li>
          <.button>
            <.link
              href={~p"/users/log_out"}
              method="delete"
              class="text-[0.8125rem] leading-6 text-zinc-900 font-semibold hover:text-zinc-700"
            >
              Log out
            </.link>
          </.button>
        </li>
      <% else %>
        <li>
          <.button>
            <.link
              href={~p"/users/log_in"}
              class="text-[0.8125rem] leading-6 text-zinc-900 font-semibold hover:text-zinc-700"
            >
              로그인
            </.link>
          </.button>
        </li>
      <% end %>
    </ul>
    """
  end

  def profile(assigns) do
    ~H"""
    <div class="flex items-center gap-4">
      <.avatar src={@current_user.avatar_url} class="w-10 h-10 rounded-full" />
      <div class="flex flex-col">
        <span class="text-[0.8125rem] leading-6 text-zinc-900 font-semibold">
          <%= @current_user.username %>
        </span>
        <span class="text-[0.8125rem] leading-6 text-zinc-500">
          <%= @current_user.email %>
        </span>
      </div>
    </div>
    """
  end

  attr :src, :string
  attr :class, :string, default: ""

  def avatar(assigns) do
    if assigns.src do
      ~H"""
      <img src={@src} class={["w-10 h-10 rounded-full", @class]} />
      """
    else
      ~H"""
      <div class={["w-10 h-10 rounded-full bg-zinc-100 flex items-center justify-center", @class]}>
        <span class="text-[0.8125rem] leading-6 text-zinc-500 font-semibold">
          <%= @current_user.username[0..0] %>
        </span>
      </div>
      """
    end
  end
end
