module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | Proofswap"      
    end
  end
end
