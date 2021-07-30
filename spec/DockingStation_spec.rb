require "DockingStation"

describe DockingStation do

  describe "Test if DockingStation responds to release_bike" do
    it { is_expected.to respond_to(:release_bike) }
  end

  describe "Tests that reponds to dock bike" do
    it { is_expected.to respond_to(:dock_bike) }
  end

  it "Tests that DockingStation.release_bike gets a bike and then if it's working" do
    subject.dock_bike
    expect(subject.release_bike).to be_a Bike
    expect(subject.release_bike.working?).to be_truthy
  end

  it "Test that DockingStation.dock docks a bike" do
    expect( subject.dock_bike ).not_to be_empty
  end

  it "Raises error when a user tries to check a bike out of an empty dock" do
    expect{ DockingStation.new.release_bike.empty? }.to raise_error("The dock is empty")
  end

  it "Raises error when a user tries to check a bike into a full dock" do
    DEFAULT_CAPACITY.times { subject.dock << Bike.new }
    expect { subject.dock_bike.full? }.to raise_error("The dock is full")
  end

  it "allows system admin to set capacity of docking station" do
    expect( DockingStation.new(3).capacity ).to eq 3
  end


end