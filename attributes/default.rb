include_attribute "cloudfoundry-common"

default[:nats_server][:host]       = "0.0.0.0"
default[:nats_server][:port]       = "4222"
default[:nats_server][:user]       = "nats"
default[:nats_server][:password]   = "nats"

default[:nats_server][:pid_file]   = File.join(node[:cloudfoundry_common][:pid_dir], "nats-server.pid")
default[:nats_server][:log_file]   = File.join(node[:cloudfoundry_common][:log_dir], "nats-server.log")
