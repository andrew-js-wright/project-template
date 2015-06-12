class ci-server {
    package {"unzip": ensure => "installed"} 

    include git
    include jenkins

    jenkins::plugin { 'scm-api': }
    jenkins::plugin { 'git-client': }
    jenkins::plugin { 'git': }
    jenkins::plugin { 'sbt': }

    jenkins::job { 'build-sample-app':
        config  => file("/tmp/vagrant-puppet/modules-bf557299be68b22534e08d4d5e413d3e/ci-server/files/build-sample-app-config.xml"),
    }

    jenkins::job { 'deploy-sample-app':
        config  => file("/tmp/vagrant-puppet/modules-bf557299be68b22534e08d4d5e413d3e/ci-server/files/deploy-sample-app-config.xml"),
    }
}
