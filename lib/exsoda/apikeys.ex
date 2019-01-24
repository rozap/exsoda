defmodule Exsoda.ApiKeys do
  alias Exsoda.Http
  alias Exsoda.Runner
  alias Exsoda.Runner.{Operations, Execute}
  import Exsoda.Runner, only: [prepend: 2]


  defmodule Create do
    @enforce_keys [:keyName]
    defstruct [:keyName]

    defimpl Execute, for: __MODULE__ do
      def run(%Create{} = c, o) do
        Http.post("/api_keys", o, Poison.encode!(c))
      end
    end
  end


  def new(options \\ []), do: Runner.new(options)
  def run(operations), do: Runner.run(operations)
  def create(%Operations{} = o, name), do: prepend(%Create{keyName: name}, o)
end