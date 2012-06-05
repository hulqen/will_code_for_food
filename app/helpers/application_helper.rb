module ApplicationHelper
  def remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)" )
  end

  def add_fields(name, f, association)
  #   new_object = f.object.class.reflect_on_association(association).build_association
  #   fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
  #     render(association.to_s.singularize + "_fields", :f => builder)
  #   end
  #   link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  end
end
