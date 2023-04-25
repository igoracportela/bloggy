RSpec.configure do |config|
  config.include Shoulda::Matchers::ActiveModel
  config.include Shoulda::Matchers::ActiveRecord
  config.include Shoulda::Matchers::Independent
end
