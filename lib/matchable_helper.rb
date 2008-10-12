module MatchableHelper
  def matchable_form_for(object)
  end
  
  def matchable_fields_for(object)
    str = "<h3>#{object.class} attribute weights: </h3>"
    object.matchable_columns.each do |col|
      str << "<div class='slider-container'>"
      str <<   label(object, "#{col.name} weight: ")
      input_id = object.class.name.downcase << "_#{col.name}_weight"
      #str <<   text_field(object, "#{col.name}_weight", :size => 3)
      str << text_field_tag(input_id, "", :size=>3)
      str << "<div input_id=\"#{input_id}\" id=\"#{object}_#{col.name}_slider\" class='ui-slider-1 matchable_slider' style='margin:10px;'>"
      str << "<div class='ui-slider-handle'></div>"
      str << "</div></div>"
      str << "<br />"
    end
    str
  end
  
end