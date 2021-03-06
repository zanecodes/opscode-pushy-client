build_iteration 1

# Using pins that agree with chef 13.11.3.
override :chef,           version: "v13.11.3"
override :ohai,           version: "v13.10.0"

override :bundler,        version: "1.15.4"
override :rubygems,       version: "2.7.6"
override :ruby,           version: "2.4.5"

override "libxml2", version: "2.9.7"
# Default in omnibus-software was too old.  Feel free to move this ahead as necessary.
override :libsodium,      version: "1.0.12"
if aix?
  # To get LibZMQ building on AIX we needed to update to 4.2.2 because it has autotools and
  # build configuration improvements.
  override :libzmq,         version: "4.2.2"
else
  # Pick last version in 4.0.x that we have tested on windows.
  # Feel free to bump this if you're willing to test out a newer version.
  override :libzmq,         version: "4.0.7"
end
