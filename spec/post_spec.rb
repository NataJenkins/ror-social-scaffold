require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validation' do
    p = Post.new(user_id: 2, content: 'alo')
    it 'should have a post ' do
      p.content = nil
      expect(Post.new).to_not be_valid
    end
  end
  it 'login validation' do
    expect(Post.create(content: 'Post description')).not_to be_valid
  end
end
