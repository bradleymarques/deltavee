require "simplecov"
SimpleCov.start("rails") do
  add_filter("app/channels/application_cable/channel.rb")
  add_filter("app/channels/application_cable/connection.rb")
  add_filter("app/jobs/application_job.rb")
  add_filter("app/mailers/application_mailer.rb")
end

ENV["RAILS_ENV"] ||= "test"

require_relative "../config/environment"
require "rails/test_help"
require "faker"

require "minitest/autorun"
require "minitest/focus"

require "mocha/minitest"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    # This is commented out as it causes SimpleCov not to function correctly
    # parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
  end
end

module Test
  module Unit
    class TestCase
      include FactoryBot::Syntax::Methods
    end
  end
end

module ActionDispatch
  class IntegrationTest
    def login_as(user:)
      params = {
        user: {
          username: user.username,
          password: "some-strong-password"
        }
      }

      post(user_session_path, params: params)
    end
  end
end

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  def login_as(user:)
    visit(root_url)
    login_buttons = page.find_all("a", text: I18n.t("navigation.login"))
    login_buttons.first.click

    fill_in("Username", with: user.username)
    fill_in("Password", with: "some-strong-password")

    find('input[name="commit"]').click

    assert(has_text?(I18n.t("devise.sessions.signed_in")))
  end
end

# Pundit helpers
def assert_permit(user, record, action)
  msg = "User #{user.inspect} should be permitted to #{action} #{record}, but isn't permitted"
  assert permit(user, record, action), msg
end

def refute_permit(user, record, action)
  msg = "User #{user.inspect} should NOT be permitted to #{action} #{record}, but is permitted"
  refute permit(user, record, action), msg
end

def permit(user, record, action)
  cls = self.class.to_s.gsub(/Test/, "")
  cls.constantize.new(user, record).public_send("#{action.to_s}")
end
