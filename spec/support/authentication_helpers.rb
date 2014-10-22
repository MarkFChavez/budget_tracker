module AuthenticationHelpers
  def sign_in_as user
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_on "Sign in"
  end
end

RSpec.configure do |config|
  config.include AuthenticationHelpers
end
