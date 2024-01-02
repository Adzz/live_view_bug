defmodule BugsWeb.Pages.Home do
  use BugsWeb, :live_view
  @impl true
  def render(assigns) do
    ~H"""
    <h1>Bug Example</h1>
    <button
      class={[
        "hidden my-6 bg-blue-500 hover:bg-blue-600",
        "justify-center px-3 py-2 rounded text-lg text-white transition-colors"
      ]}
      id="secret_third_button"
    >
      Third button
    </button>

    <button
      id="disabled_btn"
      on_error={JS.show(to: "#secret_third_button", display: "inline-block")}
      class={[
        "rounded-md my-6 text-lg",
        "text-white transition-colors",
        "hidden rounded-md px-3 py-2",
        "bg-blue-300 text-slate-500 cursor-not-allowed "
      ]}
    >
      Trigerring bug...
    </button>
    <button
      id="active_button"
      class={[
        "my-6 bg-blue-500 hover:bg-blue-600",
        "justify-center px-3 py-2 rounded text-lg text-white transition-colors"
      ]}
      phx-click={
        JS.hide(to: "#active_button")
        |> JS.show(to: "#disabled_btn", display: "inline-block")
        |> JS.dispatch("trigger_bug")
      }
    >
      Trigger Bug!
    </button>
    """
  end
end
