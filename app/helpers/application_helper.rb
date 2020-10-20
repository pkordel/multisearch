module ApplicationHelper
  def nav_link(resource, options = {})
    resource = resource.to_s
    klass = resource.classify.safe_constantize
    title = klass.model_name.plural.titleize if klass&.respond_to?(:model_name)
    title ||= resource

    name = options.delete(:name) || title
    path_options = options.delete(:path_options) || {}
    path = options.delete(:path)
    matches_controller_name = if (match_action = options.delete(:match_action))
                                action_name == match_action
                              else
                                controller_name == resource
                              end
    matches_path_options = true
    path_options.each do |key, value|
      matches_path_options = params[key] == value
    end
    css = 'nav-item'
    css << ' active' if matches_controller_name && matches_path_options
    tag.li(class: css) do
      link_to(name, path, options)
    end
  end
end
