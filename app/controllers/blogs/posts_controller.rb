module Blogs
  class PostsController < ApplicationController
    scope :posts, through: :blog, of: :current_user
  end
end
