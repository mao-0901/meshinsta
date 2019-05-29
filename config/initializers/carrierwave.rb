CarrierWave.configure do |config|
	if Rails.env.production?
		p '==========================='
		p ENV
    config.fog_credentials = {
      provider: 'OpenStack',
      openstack_tenant: ENV['CONOHA_TENANT_NAME'],
      openstack_username: ENV['CONOHA_USERNAME'],
      openstack_api_key: ENV['CONOHA_API_PASSWORD'],
      openstack_auth_url: ENV['CONOHA_API_AUTH_URL'] + '/tokens',
    }
    config.fog_directory = ENV['CONOHA_CONTAINER_NAME']
    config.storage :fog
    config.asset_host = ENV['CONOHA_ASSET_HOST'] + '/' + ENV['CONOHA_CONTAINER_NAME']
  else
    config.storage :file
  end
end