require "application_system_test_case"

class UserStoriesTest < ApplicationSystemTestCase
  setup do
    @user_story = user_stories(:one)
  end

  test "visiting the index" do
    visit user_stories_url
    assert_selector "h1", text: "User Stories"
  end

  test "creating a User story" do
    visit user_stories_url
    click_on "New User Story"

    fill_in "Creator", with: @user_story.creator_id
    fill_in "Deadline", with: @user_story.deadline
    fill_in "Description", with: @user_story.description
    fill_in "State", with: @user_story.state
    fill_in "Title", with: @user_story.title
    fill_in "Worker", with: @user_story.worker_id
    click_on "Create User story"

    assert_text "User story was successfully created"
    click_on "Back"
  end

  test "updating a User story" do
    visit user_stories_url
    click_on "Edit", match: :first

    fill_in "Creator", with: @user_story.creator_id
    fill_in "Deadline", with: @user_story.deadline
    fill_in "Description", with: @user_story.description
    fill_in "State", with: @user_story.state
    fill_in "Title", with: @user_story.title
    fill_in "Worker", with: @user_story.worker_id
    click_on "Update User story"

    assert_text "User story was successfully updated"
    click_on "Back"
  end

  test "destroying a User story" do
    visit user_stories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User story was successfully destroyed"
  end
end
