module PrototypesHelper
  def switch_proto_class(controller)
    'active' if controller == params[:controller]
  end
end
