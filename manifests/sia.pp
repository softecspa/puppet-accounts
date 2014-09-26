define accounts::sia(
  $groups         = [ 'adm', 'users' ],
  $cms_id         = '',
) {

  include accounts

  validate_array($groups)
  validate_re($cms_id, '[a-zA-Z]{2}-[0-9]{2}-[0-9]{4}', "Cms id '${cms_id}' should match pattern aa-nn-nnnn")
  
  $uri = "https://${accounts::query_host}/${accounts::query_url}?pass=${accounts::query_pass}&cms=${cms_id}"
  $accounts_hashed = usersjson($uri)
  create_resources(
    'accounts::user', 
    $accounts_hashed, 
    {
      'groups' => $groups, 
    }
  )
}
