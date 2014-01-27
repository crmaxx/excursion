module CitiesHelper
  def categories_links(categories)
    (categories.map{ |c| category_link(c) }).join(', ').html_safe
  end

  def category_link(category)
    link_to category.name, category_path(category)
  end
end
