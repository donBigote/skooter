# In this file we'll set default options for paperclip and another dependencies
# for the correct perform for skooter gem

# In this section we'll set defaults for paperclip

# paperclip_defaults = {
#   storage: :s3,
#   s3_credentials: {
#     bucket: ENV.fetch('S3_BUCKET_NAME'),
#     access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID'),
#     secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'),
#     s3_region: ENV.fetch('AWS_REGION')
#   }
# }
# Rails.application.config.paperclip_defaults = paperclip_defaults
#
# skooter_config_path = "#{Rails.root}/config/skooter_config.yml"
# SKOOTER_CONFIG = YAML.load_file(skooter_config_path)[Rails.env]

Paperclip::Attachment.default_options[:storage] = :s3
Paperclip::Attachment.default_options[:bucket] = ENV['S3_BUCKET_NAME']
Paperclip::Attachment.default_options[:s3_region] = ENV['AWS_REGION']
Paperclip::Attachment.default_options[:s3_permissions]  = :private
Paperclip::Attachment.default_options[:s3_credentials]  = {
  s3_host_name: ENV['AWS_S3_HOST_NAME'],
  access_key_id: ENV['AWS_ACCESS_KEY_ID'],
  secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
  s3_region: ENV['AWS_REGION']
}

skooter_config_path = "#{Rails.root}/config/skooter_config.yml"
SKOOTER_CONFIG = YAML.load_file(skooter_config_path)[Rails.env]
