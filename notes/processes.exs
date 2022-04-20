# In Elixir, all code runs inside processes. This processes are isolated from each other.
# And they run concurrent to one another and communicate via message passing
# Process in elixir are extremely lightweight compared to threads in other languages
# Because of this, it is not uncommon to have tens or even hundreds of thousands of processes running simultaneously.
# see the docs: https://hexdocs.pm/elixir/Process.html


# spawning new process
spawn(fn -> 1 + 2 end)
# spawn/1 takes a function which it will execute in another process


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
