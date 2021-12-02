require "test_helper"

class PostTest < ActiveSupport::TestCase
  def setup
    @post = posts(:one)
  end
  # test 'should be valid' do
  #   assert @user.valid?
  # end

  test 'post should be present' do
    @post.body = ''
    assert_not @post.valid?
  end

  test 'post should not be too long' do
    @post.body = 'a' * 300
    assert_not @post.valid?
  end

end
