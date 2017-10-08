class nvm::install inherits nvm {

  $nvm_script_url = "https://raw.githubusercontent.com/creationix/nvm/${nvm::nvm_version}/install.sh"

  if $nvm::http_proxy {
    exec { 'download-install-sh':
      provider => 'shell',
      command  => "curl -x ${nvm::http_proxy} -o ${nvm::nvm_install_tmp} -O ${nvm_script_url}",
      path     => '/bin:/usr/bin:/usr/local/bin:/usr/sbin',
      unless   => ". ${nvm::nvm_dir}/nvm.sh; nvm --version",
    }
    exec { 'install-nvm':
      provider    => 'shell',
      environment => [
        "https_proxy=${nvm::http_proxy}",
        'HOME=/tmp',
        "NVM_DIR=${nvm::nvm_dir}",
        "PROFILE=${nvm::profile}"
      ],
      command     => "bash ${nvm::nvm_install_tmp}",
      path        => '/bin:/usr/bin:/usr/local/bin:/usr/sbin',
      unless      => ". ${nvm::nvm_dir}/nvm.sh; nvm --version",
    }
  }
  else {
    exec { 'install-nvm':
      provider => 'shell',
      command  => "curl -o- ${nvm_script_url} | HOME=/tmp NVM_DIR=${nvm::nvm_dir} PROFILE=${nvm::profile} bash",
      path     => '/bin:/usr/bin:/usr/local/bin:/usr/sbin',
      unless   => ". ${nvm::nvm_dir}/nvm.sh; nvm --version",
      notify   => Class['nvm::install::node'],
    }
  }
}
