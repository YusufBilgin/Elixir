# In Elixir, all code runs inside processes. This processes are isolated from each other.
# And they run concurrent to one another and communicate via message passing
# Process in elixir are extremely lightweight compared to threads in other languages
# Because of this, it is not uncommon to have tens or even hundreds of thousands of processes running simultaneously.
# see the docs: https://hexdocs.pm/elixir/Process.html


# create a new process
spawn(fn -> 1 + 2 end)
# spawn/1 takes a function which it will execute in another process
spawn_link(fn -> 1 + 2 end)


# We can retrieve the PID of the current process by calling self/0
self()


# using Process.alive?/1 we can check if our process is alive or not
Process.alive?(self())


# send and receive messages through processes
# we can send messages to a process with send/2 and receive them with receive/1
send(self(), {:hello, "world"})

receive do  # checks current process mailbox for a message
  {:hello, msg} -> msg
  {:world, _msg} -> "won't match"
end

# receive/1 also supports guards and many clauses


# We can also set a timeout to wait for the message
receive do
  {:hello, msg} -> msg
after
  5_000 -> "nothing after 5s"
end


# While in the shell, we can use flush/0 that prints all the messages in the mailbox


# Tasks
# Tasks build on top of the spawn functions to provide better error reports and introspection
# Task module provides also functions to ease distribution like Task.async/1 and Task.await/1
Task.start(fn -> 1 + 2 end)


# State
# using a process that loop infinitely we can store data in memory
defmodule KV do
  def start_link do
    Task.start_link(fn -> loop(%{}) end)
  end

  defp loop(map) do
    receive do
      {:get, key, caller} ->
        send(caller, Map.get(map, key))
        loop(map)
      {:put, key, value} ->
        loop(Map.put(map, key, value))
    end
  end
end

{:ok, pid} = KV.start_link()  # init
send(pid, {:put, :hello, :world})  # add {:hello => :world} to map
send(pid, {:get, :hello, self()})  # get the value from :hello

# we can also register the pid
Process.register(pid, :kv)
send(:kv, {:get, :hello, self()})


# Agent module
# see docs: https://hexdocs.pm/elixir/Agent.html
{:ok, pid} = Agent.start_link(fn -> %{} end)
Agend.update(pid, fn map -> Map.put(map, :hello, :world) end)
Agend.get(pid, fn map -> Map.get(map, :hello) end)


# An example that runs Enum.take_every/2 in a process and send us the output
self_pid = self()
enumerable = File.stream!("path/to/file.txt")
spawn_link(fn -> send(self_pid, Enum.take_every(enumerable, 1)) end)
