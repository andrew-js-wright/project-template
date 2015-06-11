include git
include jenkins
jenkins::plugin { 'scm-api': }
jenkins::plugin { 'git-client': }
jenkins::plugin { 'git': }
jenkins::plugin { 'sbt': }
