# Load the Rails application.
require_relative 'application'
require "reform/form/active_model/validations"



# Initialize the Rails application.
Rails.application.initialize!

Reform::Form.class_eval do
  include Reform::Form::ActiveModel::Validations
end