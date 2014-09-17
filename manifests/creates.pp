define accounts::creates (
  $group,
  $query_host     = hiera('accounts::query_host'),
  $query_url      = hiera('accounts::query_url'),
  $query_pass     = hiera('accounts::query_pass'),
  $cms_id         = '',
  $default_shell  = hiera('accounts::default_shell'),
) {

  $cms = $cms_id?{
    ''      => $name,
    default => $cms_id
  }

  $account_hash=usersjson($query_host,"${query_url}?pass=${query_pass}&cms=${cms}")
  create_resources('accounts::create',$account_hash,{'groups' => [$group], 'shell' => $default_shell})
}
