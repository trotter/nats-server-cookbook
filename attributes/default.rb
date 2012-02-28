default[:nats_server][:config_dir] = "/etc/nats"
default[:nats_server][:host]       = "0.0.0.0"
default[:nats_server][:port]       = "4222"
default[:nats_server][:user]       = "nats"
default[:nats_server][:password]   = "nats"

default[:nats_server][:pid_file]   = "/var/run/nats-server.pid"
default[:nats_server][:log_file]   = "/var/log/nats-server.log"
