require_relative 'controller_macros'
require 'devise'

RSpec.configure do |config|
    config.include Devise::Test::ControllerHelpers, :type => :controller
end