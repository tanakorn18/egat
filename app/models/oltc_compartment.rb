# == Schema Information
# Schema version: 20110208042941
#
# Table name: oltc_compartments
#
#  id                   :integer(4)      not null, primary key
#  corrosion            :integer(10)
#  oil_fail             :integer(10)
#  visual_inspection_id :integer(4)
#

class OltcCompartment < ActiveRecord::Base
  belongs_to :visual_inspection

  #----------------------------- Validations ----------------------------------
  validates_presence_of :corrosion, :message => "can't be blank"
  validates_presence_of :oil_fail, :message => "can't be blank"
  #----------------------------------------------------------------------------

  def hi_factor
    OltcCompartmentFactor.all.each do |i|
      i.end = 100 if i.end.nil?
      if percent_oltc_compartment_factor.round.between?(i.start, i.end)
        return i.hi_factor
      end
    end
  end

  def percent_oltc_compartment_factor
    (numerator/denominator).to_f * 100.0
  end

  private
    def numerator
      sum = 0
      fields.each do |f|
        sum += (VisualInspectionCondition.find(self.send(f)).score.to_i *
                VisualInspectionCondition.weight(f, :oltc_compartments)).to_f
      end
      return sum
    end

    def denominator
      sum = 0
      fields.each do |f|
        sum += (VisualInspectionCondition.max_score(f, :oltc_compartments) *
                VisualInspectionCondition.weight(f, :oltc_compartments)).to_f
      end
      return sum
    end

    def fields
      ['corrosion', 'oil_fail']
    end
end
