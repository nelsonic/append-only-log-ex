defmodule AppendWeb.Router do
  use AppendWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", AppendWeb do
    pipe_through :browser
    get "/", PageController, :index
    resources "/addresses", AddressController
  end

  # Other scopes may use custom stacks.
  # scope "/api", AppendWeb do
  #   pipe_through :api
  # end
end
