OmniAuth.config.logger = Rails.logger

client_id = ENV['GOOGLE_CLIENT_ID']
secret = ENV['GOOGLE_CLIENT_SECRET']

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, client_id, secret, {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end
