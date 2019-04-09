#!/bin/bash
PUPPET_ENV="$(grep 'environment.*=' /etc/puppetlabs/puppet/puppet.conf 2>/dev/null | cut -d= -f 2)"
[[ -n $PUPPET_ENV ]] && [[ $PUPPET_ENV != " production" ]] && echo "Puppet environment:$PUPPET_ENV"
