module RpjaxHelper
  def content_for_workspace(workspace, &block)
    content_tag(:div, :'data-content-for' => workspace, &block)
  end

  def clean_content_for_workspace(*workspaces)
    result = ''
    workspaces.each do |workspace|
      result << "<div data-content-for=#{workspace}></div>"
    end
    result.html_safe
  end
end
