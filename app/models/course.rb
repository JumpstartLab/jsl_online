class Course < ActiveRecord::Base
  def activate
    self.update(status: "active")
    self.save
  end

  def archive
    self.update(status: "archived")
    self.save
  end
end