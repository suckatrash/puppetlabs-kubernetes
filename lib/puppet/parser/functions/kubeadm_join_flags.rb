require 'shellwords'
#
# kubeadm_join_flags.rb
#
module Puppet::Parser::Functions
  # Transforms a hash into a string of kubeadm init flags
  newfunction(:kubeadm_join_flags, :type => :rvalue) do |args|
    opts = args[0] || {}
    flags = []
    flags << "'#{opts['controller_address']}'" unless !opts['controller_address']
    flags << "--config '#{opts['config']}'" unless !opts['config']
    flags << "--cri-socket '#{opts['cri_socket']}'" unless !opts['cri_socket']
    flags << "--discovery-file '#{opts['discovery_file']}'" unless !opts['discovery_file']
    flags << "--discovery-token '#{opts['discovery_token']}'" unless !opts['discovery_token']
    flags << "--discovery-token-ca-cert-hash 'sha256:#{opts['ca_cert_hash']}'" unless !opts['ca_cert_hash']
    flags << "--discovery-token-unsafe-skip-ca-verification '#{opts['skip_ca_verification']}'" if opts['skip_ca_verification']
    flags << "--feature-gates '#{opts['feature_gates'].join(',')}'" unless !opts['feature_gates']
    flags << "--ignore-preflight-errors '#{opts['ignore_preflight_errors'].join(',')}'" unless !opts['ignore_preflight_errors']
    flags << "--node-name '#{opts['node_name']}'" unless !opts['node_name']
    flags << "--token '#{opts['token']}'" unless !opts['token']

    flags.flatten.join(' ')
  end
end
