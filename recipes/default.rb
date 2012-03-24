#
# Cookbook Name:: nats-server-cookbook
# Recipe:: default
#
# Copyright 2012, Trotter Cashion
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
include_recipe "cloudfoundry-common"
include_recipe "bluepill"

ruby_path    = File.join(rbenv_root, "versions", node.cloudfoundry_common.ruby_1_9_2_version, "bin")
gem_binaries_path = File.join(rbenv_root, "versions", node.cloudfoundry_common.ruby_1_9_2_version, "bin")
nats_config = File.join(node.cloudfoundry_common.config_dir, "nats.yml")

rbenv_gem "nats" do
  ruby_version node.cloudfoundry_common.ruby_1_9_2_version
end

template nats_config do
  source "config.yml.erb"
  owner node.cloudfoundry_common.user
  mode "0644"
  notifies :restart, "bluepill_service[nats-server]"
end

template File.join(node.bluepill.conf_dir, "nats-server.pill") do
  source "nats-server.pill.erb"
  variables(
    :binary      => File.join(gem_binaries_path, "nats-server"),
    :path        => ruby_path,
    :pid_file    => node.nats_server.pid_file,
    :config_file => nats_config
  )
end

bluepill_service "nats-server" do
  action [:enable, :load, :start]
end

