class BushingConditionsController < ApplicationController
  
  def index
    @bushing_condition = 
      BushingCondition.where("visual_inspection_id = ?", params[:visual_inspection_id]).
      order("test_date DESC").first    
  end
  
  def new
    @transformer = Transformer.find(params[:transformer_id])
    @bushing_condition = BushingCondition.new
  end

end
