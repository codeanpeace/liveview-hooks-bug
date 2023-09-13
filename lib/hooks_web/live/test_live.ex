defmodule HooksWeb.TestLive do
  use HooksWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, value: 10, value2: 20, value3: 30)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <.highlight
      id="1"
      trigger={@value}
      duration={500}
      class="data-[highlight=on]:bg-blue-500 bg-gray-900 text-white"
    >
      <div class="p-4">
        <button phx-click="click">Value 1: <%= @value %></button>
      </div>
    </.highlight>
    <.highlight
      id="2"
      trigger={@value2}
      duration={500}
      class="data-[highlight=on]:bg-blue-500 bg-gray-900 text-white"
    >
      <div class="p-4">
        <button phx-click="click2">Value 2: <%= @value2 %></button>
      </div>
    </.highlight>
    <.highlight
      id="3"
      trigger={@value3}
      duration={500}
      class="data-[highlight=on]:bg-blue-500 bg-gray-900 text-white"
    >
      <div class="p-4">
        <button phx-click="click3">Value 3: <%= @value3 %></button>
      </div>
    </.highlight>
    """
  end

  @impl true
  def handle_event("click", _, socket) do
    {:noreply,
     socket
     |> update(:value, fn value ->
       value + 1
     end)}
  end

  @impl true
  def handle_event("click2", _, socket) do
    {:noreply,
     socket
     |> update(:value2, fn value ->
       value + 1
     end)}
  end

  @impl true
  def handle_event("click3", _, socket) do
    {:noreply,
     socket
     |> update(:value3, fn value ->
       value + 1
     end)}
    |> dbg
  end

end