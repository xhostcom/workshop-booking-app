require "test_helper"

class Admin::PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_user = sign_in_admin_as admin_users(:lazaro_nixon)
    @post = posts(:one)
  end

  test "should get index" do
    get admin_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_post_url
    assert_response :success
  end

  test "should create post" do
    assert_difference("Post.count") do
      post admin_posts_url, params: { post: { body: @post.body, published: @post.published, title: @post.title } }
    end

    assert_redirected_to admin_post_url(Post.last)
  end

  test "should show post" do
    get admin_post_url(@post)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_post_url(@post)
    assert_response :success
  end

  test "should update post" do
    patch admin_post_url(@post), params: { post: { body: @post.body, published: @post.published, title: @post.title } }
    assert_redirected_to admin_post_url(@post)
  end

  test "should destroy post" do
    assert_difference("Post.count", -1) do
      delete admin_post_url(@post)
    end

    assert_redirected_to admin_posts_url
  end
end
