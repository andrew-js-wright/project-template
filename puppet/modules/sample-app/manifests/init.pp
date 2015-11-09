class sample-app {

    file { "/opt/team-1-app":
        ensure => "directory",
        owner  => "jenkins",
        group  => "jenkins",
        mode   => 750,
    }

    file { "/opt/team-2-app":
        ensure => "directory",
        owner  => "jenkins",
        group  => "jenkins",
        mode   => 750,
    }

    package {"openjdk-7-jre": ensure => "installed"} 
    package {"maven": ensure => "installed"} 
    package {"mysql-server": ensure => "installed"} 

    class { 'upstart':
       user_jobs => true,
    }

    upstart::job { 'team-1-app':
       description    => "This is an upstart for the sample app",
       respawn        => true,
       respawn_limit  => '5 10',
       user           => 'jenkins',
       group          => 'jenkins',
       chdir          => '/opt/team-1-app',
       exec           => "java -jar app.jar server config.yml",
    }

    upstart::job { 'team-2-app':
       description    => "This is an upstart for the sample app",
       respawn        => true,
       respawn_limit  => '5 10',
       user           => 'jenkins',
       group          => 'jenkins',
       chdir          => '/opt/team-2-app',
       exec           => "java -jar app.jar server config.yml",
    }
}
