class sample-app {

    file { "/opt/latest-sample-app":
        ensure => "directory",
        owner  => "jenkins",
        group  => "jenkins",
        mode   => 750,
    }

    package {"openjdk-7-jre": ensure => "installed"} 

    class { 'upstart':
       user_jobs => true,
    }

    upstart::job { 'sample-app':
       description    => "This is an upstart for the sample app",
       respawn        => true,
       respawn_limit  => '5 10',
       user           => 'jenkins',
       group          => 'jenkins',
       chdir          => '/opt/latest-sample-app',
       exec           => "bin/sample-play-app",
    }
}
