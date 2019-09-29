# In this file we'll set default options for paperclip and another dependencies

# This code may not be necessary at all with active storage.

## First you need to update models list located inside skooter_config file and
## you need to make sure that the storage service is configurated as :filesystem
## or if you want to use S3 you need to update that option as :s3.

# skooter_config_path = "#{Rails.root}/config/skooter_config.yml"
# SKOOTER_CONFIG = YAML.load_file(skooter_config_path)[Rails.env]

## After that you made the before configuration, you need to set your ENV
## variables like are listed in this section because if you want to store your
## files in S3 Service, you have to set your ENV inside a file or using heroku
## service if you're using it.
## you can use a gem like dotenv-rails or Figaro to set your ENV variables for
## development and when you deploy the app, you can use heroku service or you
## can still using a gem if you want

# if SKOOTER_CONFIG['PAPERCLIP_STORAGE'] == :s3 || :S3
#   paperclip_defaults = {
#     storage: SKOOTER_CONFIG['PAPERCLIP_STORAGE'],
#     s3_credentials: {
#       bucket: ENV.fetch('S3_BUCKET_NAME'),
#       access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID'),
#       secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'),
#       s3_region: ENV.fetch('AWS_REGION')
#     },
#     s3_permissions: :private
#   }
#   Paperclip::Attachment.default_options.update(paperclip_defaults)
# end
