# require 'spec_helper'
#
# describe 'user authentication' do
#   let(:user) { create(:user)}
#   let!(:account) { create(:account , owner: user)}
#
#   it 'allows signin with valid credentials' do
#     sign_user_in(user, subdomain: account.subdomain )
#     expect(page).to have_content('Signed in successfully')
#   end
#
#   it 'does not allow user to sign in if they are not on subdomain' do
#     expect { visit new_user_session_path }.to raise_error ActionController::RoutingError
#   end
#
#   it 'does not allow signin with invalid credentials' do
#     sign_user_in(user, subdomain: account.subdomain , password: 'wrong pw')
#
#     expect(page).to have_content('Invalid email or password')
#   end
#
#   it 'allows user to sign out' do
#     sign_user_in(user, subdomain: account.subdomain)
#
#     click_link 'Sign out'
#     expect(page).to have_content('Signed out successfully')
#   end
# end
#
# def sign_user_in(user, opts={})
#   # Capybara.app_host = "http://#{opts[:subdomain]}.lvh.me:3000"
#   # Capybara.current_session.driver.reset!
#   # Capybara.default_host = opts[:subdomain]
#   Capybara.app_host = "http://#{opts[:subdomain]}.lvh.me:3000"
#   visit new_user_session_url(subdomain: opts[:subdomain])
#   fill_in 'Email', with: user.email
#   fill_in 'Password', with: (opts[:password] || user.password)
#   click_button 'Sign in'
# end