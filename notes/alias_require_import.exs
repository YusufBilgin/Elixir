# Alias the module so it can be called as Bar instead of Foo.Bar
alias Foo.Bar, as: Bar
# calling alias without an :as option sets the alias automatically to the last part of the module name
alias Foo.Bar
# alias is lexically scoped, this allows us to set aliases inside functions or modules and it wont affect outside


# Require the module in order to use its macros
require Foo
# for instance to use Integer.is_odd/1
require Integer
Integer.is_odd(3)


# Import functions from Foo so the can be called without the 'Foo.' prefix
import Foo
# We can also import specific functions using only:
import List, only: [duplicate: 2]  # we imported only the function duplicate (with arity 2) from List
# there is another option called :except to import everything in a module except a list of functions
# note: import is lexically scoped


# Invokes the custom code defined in Foo as an extension point
use Foo
