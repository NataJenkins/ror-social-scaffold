require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validation' do
    p = Post.new(user_id: 1, content: 'Alo')
    it 'should have content' do
      p.content = nil
      expect(Comment.new(user_id: 1)).to_not be_valid
    end
  end
end
