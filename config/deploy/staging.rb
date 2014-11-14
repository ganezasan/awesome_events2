# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary
# server in each group is considered to be the first
# unless any hosts have the primary property set.
# Don't declare `role :all`, it's a meta role
role :app, %w{vagrant@vagrant.local}
role :web, %w{vagrant@vagrant.local}
role :db,  %w{vagrant@vagrant.local}

set :rails_env, :staging
