module ApplicationHelper
  def app_name
    "ProLearning"
  end

  def javascript(*files)
    content_for(:head) { javascript_include_tag(*files) }
  end
end
