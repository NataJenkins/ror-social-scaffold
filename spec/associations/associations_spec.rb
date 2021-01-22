require 'rails_helper'

RSpec.describe 'User' do

  it "should have many posts" do
    t = User.reflect_on_association(:posts)
    expect(t.macro).to eq(:has_many)
  end

  it "should have many comments" do
    t = User.reflect_on_association(:comments)
    expect(t.macro).to eq(:has_many)
  end

  it "should have many likes" do
    t = User.reflect_on_association(:likes)
    expect(t.macro).to eq(:has_many)
  end

  it "should have many friendships" do
    t = User.reflect_on_association(:friendships)
    expect(t.macro).to eq(:has_many)
  end

end
