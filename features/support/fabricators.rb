module FabricatorsWorld
  def fabricate_course
    FactoryGirl.create :course
  end
end

World(FabricatorsWorld)
