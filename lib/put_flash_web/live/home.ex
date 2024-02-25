defmodule PutFlashWeb.Home do
  use PutFlashWeb, :live_view

  def render(assigns) do
    ~H"""
    <h1>Welcome to Put Flash!</h1>
    <.button>info flash</.button>
    <.button>error flash</.button>
    """
  end
end
