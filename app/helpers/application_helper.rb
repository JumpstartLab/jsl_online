module ApplicationHelper
  def format_time(time)
    time.localtime.strftime("%b %e, %Y")
  end

  def admin_path?
    request.original_fullpath.split("/").any? {|path| path == "admin"}
  end
end
