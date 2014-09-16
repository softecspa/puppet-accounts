define accounts::create(
  $ensure,
  $uid,
  $comment,
  $username,
  $groups,
  $key_type     = '',
  $key          = '',
  $key_comment  = '',
) {

  if!defined(User[$username]) {
    user {$username:
      ensure     => $ensure,
      uid        => $uid,
      comment    => $comment,
      managehome => true,
      groups     => $groups,
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
