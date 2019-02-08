module ApplicationHelper
  def belongs_to_user?(resource)
    resource.user == current_user
  end

  def category_name_and_count(category)
    "#{category.name} <span class=\"badge\">#{category.posts.count}</span>"
      .html_safe
  end
end
