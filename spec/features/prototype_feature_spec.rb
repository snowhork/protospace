require 'rails_helper'

RSpec.describe Prototype, :type => :feature do
  let(:resize) {
    Capybara.current_session.driver.browser.manage.window.resize_to(1280, 720)
  }
  before :each do
    visit '/'
    resize
  end
  describe "sign up" do
    specify 'screenshot' do
      first(".navbar-btn").click
      first(".text-center p a").click

      find("#user_nickname").set("まるまる")
      find("#user_email").set("marumaru@marumaru.jp")
      find("#user_password").set(123456)
      find("#user_member").set("メンバー")
      find("#user_profile").set("プロフィール")
      find("#user_works").set("ワーク")

      first("#submit-btn").click
      first(".navbar-brand").click

      page.save_screenshot 'sign_up.png'
    end
  end

  describe "sign in and upload prototype" do
    specify "screenshot" do
      first(".navbar-btn").click

      find("#inputEmail").set("marumaru@marumaru.jp")
      find("#inputPassword").set(123456)
      first("#submit-btn").click
      first(".navbar-btn").click

      find("#prototype_title").set("タイトル")
      find("#prototype_catch_copy").set("キャッチコピー")
      find("#prototype_concept").set("コンセプト")
      path = 'spec/fixtures/img/test.jpg'
      attach_file 'js-main_image_form', path, visible: false

      first("#submit-btn").click
      page.save_screenshot 'sign_in.png'
    end
  end
end
