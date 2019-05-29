CarrierWave.configure do |config|
	if Rails.env.production?
		CONOHA_TENANT_NAME = 'gnct37802526'
		CONOHA_USERNAME = 'gncu37802526'
		CONOHA_API_PASSWORD = '7GeN9W6xRy'
		CONOHA_API_AUTH_URL = 'https://identity.tyo1.conoha.io/v2.0'
		CONOHA_CONTAINER_NAME = 'meshinsta'
    config.fog_credentials = {
			provider: 'OpenStack',
			openstack_tenant: CONOHA_TENANT_NAME,
			openstack_username: CONOHA_USERNAME,
			openstack_api_key: CONOHA_API_PASSWORD,
			openstack_auth_url: CONOHA_API_AUTH_URL + '/tokens',
    }
    config.fog_directory = CONOHA_CONTAINER_NAME
    config.storage :fog
    config.asset_host = 'https://object-storage.tyo1.conoha.io/v1/nc_a46210d457c54c1cbbab5602c2b720c5' + '/' + CONOHA_CONTAINER_NAME
  else
    config.storage :file
  end
end