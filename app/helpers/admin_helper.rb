module AdminHelper
  def first_name(name)
    name.split(" ")[0]
  end

  def courses_title(current_url)
    case current_url
    when "/admin/course" then "ALL COURSES"
    when "/admin/courses/active" then "ACTIVE COURSES"
    when "/admin/courses/pending" then "PENDING COURSES"
    when "/admin/courses/archived" then "ARCHIVED COURSES"
    end
  end
end