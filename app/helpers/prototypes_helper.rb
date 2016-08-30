module PrototypesHelper
  def switch_proto_class(controller)
    # controller == params[:controller] ? {class: 'active', role: "presentation"} : {role: "presentation"}
    'active' if controller == params[:controller]
  end
end
