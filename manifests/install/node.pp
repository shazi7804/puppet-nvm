class nvm::install::node inherits nvm {
  if $nvm::http_proxy {
    exec { 'install-node':
      provider    => 'shell',
      environment => ["https_proxy=${nvm::http_proxy}"],
      command     => ". ${nvm::nvm_dir}/nvm.sh \
                     && export http_proxy=${nvm::http_proxy} \
                     && nvm install ${nvm::node_version}",
      path        => '/bin:/usr/bin:/usr/local/bin:/usr/sbin',
      unless      => ". ${nvm::nvm_dir}/nvm.sh && nvm which ${nvm::node_version}",
      require     => Class['nvm::install'],
    }
  }
  else {
    exec { 'install-node':
      provider => 'shell',
      command  => ". ${nvm::nvm_dir}/nvm.sh \
                  && nvm install ${nvm::node_version}",
      path     => '/bin:/usr/bin:/usr/local/bin:/usr/sbin',
      unless   => ". ${nvm::nvm_dir}/nvm.sh && nvm which ${nvm::node_version}",
      require  => Class['nvm::install'],
    }
  }

  if $nvm::set_default {
    exec { 'set-default-node':
      provider => 'shell',
      command  => ". ${nvm::nvm_dir}/nvm.sh; \
                  nvm alias default ${nvm::node_version}",
      path     => '/bin:/usr/bin:/usr/local/bin:/usr/sbin',
      unless   => ". ${nvm::nvm_dir}/nvm.sh && nvm which default | grep v${nvm::node_version}",
      require  => Exec['install-node'],
    }
  }
}
