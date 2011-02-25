# == Schema Information
# Schema version: 20110223153034
#
# Table name: oltc_oil_contaminations
#
#  id             :integer(4)      not null, primary key
#  version        :integer(4)
#  color          :float
#  test_by        :string(255)
#  test_date      :datetime
#  water_content  :integer(4)
#  work_order     :string(255)
#  oltc_type      :integer(10)
#  transformer_id :integer(4)
#  test_type      :integer(4)
#

class OltcOilContamination < ActiveRecord::Base
  scope :most_recent, lambda { |transformer_id|
    where('transformer_id = ?', transformer_id).order('test_date DESC').limit(1)
  }
  
  belongs_to :transformer
  
  validates_presence_of :test_date, :on => :create, :message => "can't be blank"
  
  def thai_test_date
    test_date.strftime("%d/%m/%Y")
  end
  
end
