# IO module
IO.puts("writes item to the given device, by default its :stdio")

IO.gets("yes or no? ")


# File module
{:ok, file} = File.open("hello", [:write])  # creates a file if there is no one named hello
# File.open/2 creates a process
IO.binwrite(file, "world")
File.close(file)  # close process

File.read("hello")

# if we want read our files using IO.binread/2 we should add :read
{:ok, file} = File.open("hello", [:write, :read])
IO.binread(file, 1) # reads the firs char


# File module has many functions to work with the file system
File.rm("path/file.txt")
File.mkdir("new_directory/")
File.mkdir_p("new_directory/codes/") # creates also missing parent directories
File.cp("source_file.txt", "destination/test.txt") # there will be returned an error if the source is a file
# and destination a directory: {:error, :eisdir}
File.rm_rf("directory/")  # it will return a list that contains the removed files
File.ls!()

# the functions in File module have two different versions.
# The variant with a (!) will raise an error instead of returning a tuple
# The version without (!) is preferred when you want to handle different outcomes using pattern matching
case File.read(file) do
  {:ok, body}      -> # do something with the body
  {:error, reason} -> # handle the error caused by reason
end


# Path module
Path.expand("") # it will return user home path
Path.expand("~/hello")  # c:/Users/user/hello
Path.expand("/hello")   # c:/hello

Path.join("foo", "bar") # "foo/bar"
