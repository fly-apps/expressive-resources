class ApplicationController < ActionController::Base
  class_attribute :model_class, :association, :context_method, :scope_name

  def self.scope(*args, **kwargs)
    case [ args, **kwargs ]
      in [[scope_name]]
      in [[scope_name], { of: context_method }]
      in [[relationship_name], { through: scope_name }]
      in [[relationship_name], { through: scope_name, of: context_method }]
    end

    self.scope_name = scope_name
    self.model_class = scope_name.to_s.singularize.camelize.constantize
    self.association = self.model_class.reflect_on_association(:posts)
    self.context_method = context_method
  end

  protected

  def current_user
    User.new(name: "Brad Gessler")
  end
end
