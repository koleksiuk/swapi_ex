defmodule SwapiEx.Resource do
  defmacro __using__(resource_path) do
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

      def base_path do
        case unquote(resource_path) do
          [] -> resource_path_from_module
          _ -> unquote(resource_path)
        end
      end

      defp resource_path_from_module do
        __MODULE__
        |> to_string
        |> String.split(".")
        |> Enum.at(-1)
        |> String.downcase
      end
    end
  end
end
