require 'fog'

CONOHA_TENANT_NAME = 'gnct37802526'
CONOHA_USERNAME = 'gncu37802526'
CONOHA_API_PASSWORD = '7GeN9W6xRy'
CONOHA_API_AUTH_URL = 'https://identity.tyo1.conoha.io/v2.0'
CONOHA_CONTAINER_NAME = 'meshinsta'

strage = Fog::Storage.new(
  provider: 'OpenStack',
  openstack_tenant: CONOHA_TENANT_NAME,
  openstack_username: CONOHA_USERNAME,
  openstack_api_key: CONOHA_API_PASSWORD,
  openstack_auth_url: CONOHA_API_AUTH_URL + '/tokens',
)

strage.put_container(CONOHA_CONTAINER_NAME,
  public: true, headers: { 'X-Web-Mode' => 'true' })