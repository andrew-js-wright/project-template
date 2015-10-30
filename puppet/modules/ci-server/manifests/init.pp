class ci-server {
    package {"unzip": ensure => "installed"} 

    include git
    include jenkins

    jenkins::plugin { 'scm-api': }
    jenkins::plugin { 'git-client': }
    jenkins::plugin { 'git': }
    jenkins::plugin { 'sbt': }

    jenkins::job { 'build-sample-app':
        config  => file('/tmp/vagrant-puppet/modules-8a4de7b03250a2fada33997201293f49/ci-server/files/build-sample-app-config.xml'),
    }
}
