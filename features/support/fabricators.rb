module FabricatorsWorld
  def fabricate_course
    FactoryGirl.create :course
  end

  def fabricate_recording_sheet
    FactoryGirl.create :recording_sheet
  end
end

World(FabricatorsWorld)
