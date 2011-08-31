class Discussion < ActiveRecord::Base

  include DateUtil

  validates_presence_of :title, :details

  belongs_to :user
  belongs_to :group

  def created_str
    format_dd_MM_yyyy_hh_mm self.created
  end

end
