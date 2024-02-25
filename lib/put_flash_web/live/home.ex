defmodule PutFlashWeb.Home do
  use PutFlashWeb, :live_view

  def render(assigns) do
    ~H"""
    <h1>Welcome to Put Flash!</h1>
    <.button phx-click="click_info_flash">info flash</.button>
    <.button phx-click="click_error_flash">error flash</.button>
    """
  end

  def handle_event("click_info_flash", _params, socket) do
    socket = put_flash(socket, :info, "This is an info flash")
    {:noreply, socket}
  end

  def handle_event("click_error_flash", _params, socket) do
    socket = put_flash(socket, :error, "This is an error flash")
    {:noreply, socket}
  end
end
