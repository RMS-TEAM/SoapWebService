module ApplicationHelper
  def title
    base_title = "BEC"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
end
