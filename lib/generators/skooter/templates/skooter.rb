# In this file we'll set default options for paperclip and another dependencies
# for the correct perform for skooter gem

skooter_config_path = "#{Rails.root}/config/skooter_config.yml"
SKOOTER_CONFIG = YAML.load_file(skooter_config_path)[Rails.env]

# In this section we'll set defaults for paperclip

paperclip_defaults = {
  storage: SKOOTER_CONFIG['PAPERCLIP_STORAGE'],
  s3_credentials: {
    bucket: ENV.fetch('S3_BUCKET_NAME'),
    access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID'),
    secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'),
    s3_region: ENV.fetch('AWS_REGION')
  },
  s3_permissions: :private
}
Paperclip::Attachment.default_options.update(paperclip_defaults)
