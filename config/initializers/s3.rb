
CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => ENV["YOUR AMAZON ACCESS KEY"],
      :aws_secret_access_key  => ENV["YOUR AMAZON SECRET KEY"],
      :region                 => 'ap-southeast-1' # Change this for different AWS region. Default is 'us-east-1'
  }
  config.fog_directory  = "johnsonbnb"
end