module ApplicationHelper
  def full_title(page_title = '')
    base_title = "Aamidal, Sci-fi Adventures in the Three Sisters"

    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
end
