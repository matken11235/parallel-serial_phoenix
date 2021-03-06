defmodule ParallelSerialWeb.Router do
  use ParallelSerialWeb, :router

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

  scope "/", ParallelSerialWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/parallel/study", PageController, :parallel_search
    get "serial/study", PageController, :serial_search
  end

  # Other scopes may use custom stacks.
  # scope "/api", ParallelSerialWeb do
  #   pipe_through :api
  # end
end
