module Capitalize
  def capitalize_names
    self[:first_name][0] = self[:first_name][0].capitalize
    self[:last_name][0] = self[:last_name][0].capitalize
  end
end
