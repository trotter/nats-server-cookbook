include_attribute "cloudfoundry-common"

# Nats will bind to this host.
default[:nats_server][:host]       = "0.0.0.0"

# Nats will bind to this port.
default[:nats_server][:port]       = default[:cloudfoundry_common][:nats_server][:port]

# Clients will connect to nats as this user.
default[:nats_server][:user]       = "nats"

# Clients will connect to nats with this password.
default[:nats_server][:password]   = "nats"

# Where to write Nats's pid.
default[:nats_server][:pid_file]   = File.join(node[:cloudfoundry_common][:pid_dir], "nats-server.pid")

# Where to write Nats's logs.
default[:nats_server][:log_file]   = File.join(node[:cloudfoundry_common][:log_dir], "nats-server.log")
