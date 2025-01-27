Administrate::Namespace.class_eval do
  def resources
    super.reject do |resource|
      # Exclude models based on their namespace or name
      resource.name.start_with?("ActionMailbox::") ||
      resource.name.start_with?("ActionText::") ||
      resource.name.start_with?("ActiveStorage::")
    end
  end
end
