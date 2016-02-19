defmodule SwapiEx.Resource do
  defmacro __using__(resource_name) do
    quote do
      def fetch do
        base_path
        |> SwapiEx.Api.fetch
        |> get_body
        |> Poison.decode!
      end

      def fetch(id) do
        "#{base_path}/#{to_string(id)}"
        |> SwapiEx.Api.fetch
        |> get_body
        |> Poison.decode!
      end

      defp get_body(response) do
        response.body
      end

      defp base_path do
        unquote(resource_name)
      end
    end
  end
end
