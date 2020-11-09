defmodule LongRunningViewEventWeb.Router do
  use LongRunningViewEventWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {LongRunningViewEventWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LongRunningViewEventWeb do
    pipe_through :browser

    live "/", PageLive, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", LongRunningViewEventWeb do
  #   pipe_through :api
  # end
end
