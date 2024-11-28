defmodule RumblWeb.WatchHTML do
  use RumblWeb, :html

  embed_templates "watch_html/*"

  @doc """
  Renders a video form.
  """

  def player_id(video) do
    ~r/^(?:https?:\/\/)?(?:www\.)?(?:youtu\.be\/|youtube\.com\/(?:watch\?v=|embed\/|v\/))(?<id>[^#&?]*).*/
    |> Regex.named_captures(video.url)
    |> Map.get("id")
  end
end
