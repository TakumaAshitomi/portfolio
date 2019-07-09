require "rails_helper"
RSpec.feature "Post", type: :system do
  scenario "User creates a new post" do
    @user = create(:user)
    @user.confirm
    login_as(@user)
    visit posts_new_path
    fill_in "title", with: "testtitle"
    fill_in "editor", with: "testdescription"
    click_button "登録する"
    expect(page).to have_content "作成しました。"
  end
  
  scenario "can edit by owner" do
    @user = create(:user)
    @user.confirm
    login_as(@user)
    @post = create(:post)
    @post.user_id = @user.id
    visit "/posts/#{@post.id}/edit"
    fill_in "title", with: "testtitle2"
    fill_in "editor", with: "testdescription2"
    click_button "変更"
    expect(page).to have_content "変更しました。"
  end
  
  scenario "can delete by owner", js: true do
    @user = create(:user)
    @user.confirm
    login_as(@user)
    @post = create(:post)
    @post.user_id = @user.id
    visit "/posts/#{@post.id}/edit"
    click_on "削除"
    page.driver.browser.switch_to.alert.accept
    expect(page).to have_content "削除しました"
  end
  
  scenario "can see by followed user", js: true do 
    @user = create(:user)
    @user.confirm
    @user2 = create(:user)
    @user2.confirm
    login_as (@user)
    Subscription.create(user_id: @user.id, followed_id: @user2.id)
    @post = Post.create(title: "test", description: "test", user_id: "#{@user2.id}")
    visit "/users/#{@user.id}"
    click_on "Activity"
    expect(page).to have_content "#{@post.title}"
  end
end