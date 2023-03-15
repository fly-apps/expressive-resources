class BlogsController < ApplicationController
  scope :blogs, of: :current_user

  def index
    @blogs = scope
    render plain: @blogs.inspect
  end

  def show
    @blog = scope.find(params[:id])
    render plain: @blog.inspect
  end

  protected

  def scope_context
    self.send self.class.context_method
  end

  def scope_association
    scope_context.association self.class.scope_name
  end

  def scope
    scope_association.scope
  end
end
