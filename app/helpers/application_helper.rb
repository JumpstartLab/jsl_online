module ApplicationHelper
  def format_time(time)
    time.localtime.strftime("%b %e, %Y")
  end
end
