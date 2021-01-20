require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validation' do
    p = Post.new(user_id: 1, content: 'Alo')
    it 'should have content' do
      p.content = nil
      expect(Comment.new(user_id: 1)).to_not be_valid
    end
  end

  it 'validation' do
    user = User.create(name: 'test', email: 'test@test', password: 'testtest')
    post = Post.create(content: 'description', user_id: user.id)
    expect(Comment.create(content: 'content', user_id: user.id, post_id: post.id)).to be_valid
  end
end
