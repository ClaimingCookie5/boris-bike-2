require "DockingStation"

describe DockingStation do
    describe "Test 'release_bike'" do
    it { is_expected.to respond_to(:release_bike) }
    end
end
