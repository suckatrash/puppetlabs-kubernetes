require 'shellwords'
#
# kubeadm_init_flags.rb
#
module Puppet::Parser::Functions
  # Transforms a hash into a string of kubeadm init flags
  newfunction(:kubeadm_init_flags, :type => :rvalue) do |args|
    opts = args[0] || {}
    flags = []
    flags << "--apiserver-advertise-address '#{opts['apiserver_advertise_address']}'" unless !opts['apiserver_advertise_address']
    flags << "--apiserver-bind-port '#{opts['apiserver_bind_port']}'" unless !opts['apiserver_bind_port']
    flags << "--apiserver-cert-extra-sans '#{opts['apiserver_cert_extra_sans'].join(',')}'" unless !opts['apiserver_cert_extra_sans']
    flags << "--cert-dir '#{opts['cert_dir']}'" unless !opts['cert_dir']
    flags << "--config '#{opts['config']}'" unless !opts['config']
    flags << "--cri-socket '#{opts['cri_socket']}'" unless !opts['cri_socket']
    flags << '--dry-run' if opts['dry_run']
    flags << "--feature-gates '#{opts['feature_gates'].join(',')}'" unless !opts['feature_gates']
    flags << "--ignore-preflight-errors='#{opts['ignore_preflight_errors'].join(',')}'" unless !['ignore_preflight_errors']
    flags << "--kubernetes-version '#{opts['kubernetes_version']}'" unless !opts['kubernetes_version']
    flags << "--node-name '#{opts['node_name']}'" unless !opts['node_name']
    flags << "--pod-network-cidr '#{opts['pod_network_cidr']}'" unless !opts['pod_network_cidr']
    flags << "--service-cidr '#{opts['service_cidr']}'" unless !opts['service_cidr']
    flags << "--service-dns-domain '#{opts['service_dns_domain']}'" unless !opts['service_dns_domain']
    flags << '--skip-token-print' if opts['skip_token_print']
    flags << "--token '#{opts['token']}'" unless !opts['token']
    flags << "--token-ttl '#{opts['token_ttl']}'" unless !opts['token_ttl']

    flags.flatten.join(' ')
  end
end
