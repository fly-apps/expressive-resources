class PostsController < ApplicationController
  scope :posts, of: :current_user
end
