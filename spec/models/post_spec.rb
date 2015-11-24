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

  describe '#slug' do
    it 'is set before a post is saved' do
      before_save = post.slug

      post.save
      saved_post = Post.all.first

      expect(before_save).to be_nil
      expect(saved_post.slug).to eq 'hello-world'
    end
  end
end
