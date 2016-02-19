defmodule SwapiEx.Api do
  def fetch(path) do
    path
    |> build_url
    |> IO.puts
    |> HTTPotion.get
  end

  defp build_url(path) do
    "#{Application.get_env(:swapi_ex, :base_url)}/#{path}"
  end
end
