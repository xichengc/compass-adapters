#
# Cookbook Name:: openstack-metering
# Recipe:: api
#
# Copyright 2013, AT&T Services, Inc.
# Copyright 2013, Craig Tracey <craigtracey@gmail.com>
# Copyright 2013, SUSE Linux GmbH
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

include_recipe "openstack-metering::common"

directory ::File.dirname(node["openstack"]["metering"]["api"]["auth"]["cache_dir"]) do
  owner node["openstack"]["metering"]["user"]
  group node["openstack"]["metering"]["group"]
  mode  00700
end

platform = node["openstack"]["metering"]["platform"]
platform["api_packages"].each do |pkg|
  package pkg
end

service platform["api_service"] do
  action :start
end
