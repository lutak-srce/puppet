# Print puppet environment if not production or master
PUPPET_ENV="$(grep 'environment.*=' /etc/puppetlabs/puppet/puppet.conf 2>/dev/null | cut -d= -f 2)"
[[ -n $PUPPET_ENV ]] && [[ $PUPPET_ENV != " production" ]] && [[ $PUPPET_ENV != " master" ]] && echo "Puppet environment:$PUPPET_ENV"
