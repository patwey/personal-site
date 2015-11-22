require 'spec_helper'

describe Post do
  let(:post) do
    Post.new(title: 'Hello World',
             body: 'This is the body of my post.')
  end

  describe '#title' do
    it 'exists' do
      untitled_post = post
      untitled_post.title = ''

      expect(untitled_post).not_to be_valid
    end

    it 'is unique' do
      post.save
      repeated_post = Post.new(title: 'Hello World',
                               body: 'This is a different body.')

      expect(repeated_post).not_to be_valid
    end
  end

  describe '#body' do
    it 'exists' do
      bodyless_post = post
      bodyless_post.body = ''

      expect(bodyless_post).not_to be_valid
    end
  end
end
