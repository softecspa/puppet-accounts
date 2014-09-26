define accounts::create(
  $ensure,
  $uid,
  $comment,
  $username,
  $groups,
  $shell,
  $key_type     = '',
  $key          = '',
  $key_comment  = '',
) {

<<<<<<< Updated upstream:manifests/create.pp
  $all_groups = concat($groups,['adm','users'])

  if!defined(User[$username]) {
=======
  if !defined(User[$username]) {
>>>>>>> Stashed changes:manifests/user.pp
    user {$username:
      ensure     => $ensure,
      uid        => $uid,
      comment    => $comment,
      managehome => true,
<<<<<<< Updated upstream:manifests/create.pp
      groups     => $all_groups,
=======
      groups     => $groups,
>>>>>>> Stashed changes:manifests/user.pp
      shell      => $shell,
      require    => Group[$groups],
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
