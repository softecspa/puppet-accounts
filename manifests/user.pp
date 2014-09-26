define accounts::user(
  $ensure,
  $uid,
  $comment,
  $username,
  $groups       = [ 'users' ],
  $shell        = '/bin/bash',
  $key_type     = '',
  $key          = '',
  $key_comment  = '',
) {

  $real_groups = concat($groups,['adm','users'])

  if !defined(User[$username]) {
    user {$username:
      ensure     => $ensure,
      uid        => $uid,
      comment    => $comment,
      managehome => true,
      groups     => $real_groups,
      shell      => $shell,
    }
  }

  if $key != '' and $ensure == 'present' {
    if!defined(Ssh_authorized_key[$key_comment]){
      ssh_authorized_key{$key_comment:
        user => $username,
        type => $key_type,
        key  => $key,
      }
    }
  }

}
