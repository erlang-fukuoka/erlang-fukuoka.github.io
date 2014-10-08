defmodule Useless do
  def add(a,b) do
    a + b
  end

  def hello() do
    IO.puts "Hello, World!"
  end

  def greet_and_add_two(x) do
    hello()
    add(x,2)
  end
end