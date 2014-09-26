define accounts::sia(
  $groups         = [ 'adm', 'users' ],
  $query_host     = '',
  $query_url      = '',
  $query_pass     = '',
  $cms_id         = '',
) {

  validate_array($groups)
  validate_re($cms_id, '[a-zA-Z]{2}-[0-9]{2}-[0-9]{4}', 'Cms id should match pattern aa-nn-nnnn')
  if ! is_domain_name($query_host) {
    fail("The query_host seems not a valid domain name: ${query_host}.")
  }
  
  $cms = $cms_id?{
    ''      => $name,
    default => $cms_id
  }


  $uri = "https://$query_host/${query_url}?pass=${query_pass}&cms=${cms}"

  $accounts_hashed = usersjson($uri)
  create_resources(
    'accounts::user', 
    $accounts_hashed, 
    {
      'groups' => $groups, 
    }
  )
}
