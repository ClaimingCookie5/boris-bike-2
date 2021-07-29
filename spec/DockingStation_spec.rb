require "DockingStation"

describe DockingStation do
  

  describe "Test if DockingStation responds to release_bike" do
    it { is_expected.to respond_to(:release_bike) }
  end

  describe "Tests that reponds to dock bike" do
    it { is_expected.to respond_to(:dock_bike) }
  end

  it "Tests that DockingStation.release_bike gets a bike and then if it's working" do
    if !subject.dock.empty?
      expect(subject.release_bike).to be_a Bike
      expect(subject.release_bike.working?).to eq true
    end
  end

  it "Test that DockingStation.dock docks a bike" do
    expect(subject.dock_bike).not_to be_empty
  end

  it "Raises error when a user tries to check a bike out of an empty dock" do
    expect{ subject.release_bike }.to raise_error("The dock is empty") if subject.dock.empty?
  end

  it "Raises error when a user tries to check a bike into a full dock" do
    full_dock = DockingStation.new
    (0..11).each do |bike|
      full_dock.dock << "Bike"
    end
    expect { full_dock.dock_bike }.to raise_error("The dock is full") if full_dock.dock.count >= 10
  end

end