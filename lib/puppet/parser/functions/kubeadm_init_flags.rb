require 'shellwords'
#
# kubeadm_init_flags.rb
#
module Puppet::Parser::Functions
  # Transforms a hash into a string of kubeadm init flags
  newfunction(:kubeadm_init_flags, :type => :rvalue) do |args|
    opts = args[0] || {}
    flags = []
    flags << "--apiserver-advertise-address '#{opts['apiserver_advertise_address']}'" if opts['apiserver_advertise_address'].to_s != 'undef'
    flags << "--apiserver-bind-port '#{opts['apiserver_bind_port']}'" if opts['apiserver_bind_port'].to_s != 'undef'
    flags << "--apiserver-cert-extra-sans '#{opts['apiserver_cert_extra_sans'].join(',')}'" unless opts['apiserver_cert_extra_sans'].nil
    flags << "--cert-dir '#{opts['cert_dir']}'" if opts['cert_dir'].to_s != 'undef'
    flags << "--config '#{opts['config']}'" if opts['config'].to_s != 'undef'
    flags << "--cri-socket '#{opts['cri_socket']}'" if opts['cri_socket'].to_s != 'undef'
    flags << '--dry-run' if opts['dry_run']
    flags << "--feature-gates '#{opts['feature_gates'].join(',')}'" unless opts['feature_gates'].nil
    flags << "--ignore-preflight-errors='#{opts['ignore_preflight_errors'].join(',')}'" if opts['ignore_preflight_errors'].to_s != 'undef'
    flags << "--kubernetes-version '#{opts['kubernetes_version']}'" if opts['kubernetes_version'].to_s != 'undef'
    flags << "--node-name '#{opts['node_name']}'" if opts['node_name'].to_s != 'undef'
    flags << "--pod-network-cidr '#{opts['pod_network_cidr']}'" if opts['pod_network_cidr'].to_s != 'undef'
    flags << "--service-cidr '#{opts['service_cidr']}'" if opts['service_cidr'].to_s != 'undef'
    flags << "--service-dns-domain '#{opts['service_dns_domain']}'" if opts['service_dns_domain'].to_s != 'undef'
    flags << '--skip-token-print' if opts['skip_token_print']
    flags << "--token '#{opts['token']}'" if opts['token'].to_s != 'undef'
    flags << "--token-ttl '#{opts['token_ttl']}'" if opts['token_ttl'].to_s != 'undef'

    flags.flatten.join(' ')
  end
end
