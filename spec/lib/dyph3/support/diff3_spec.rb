require 'spec_helper'

describe Dyph3::Support::Diff3 do
  let(:current_differ) { Dyph3::TwoWayDiffers::ResigDiff }
  let(:diff3)  { Dyph3::Support::Diff3 }
  describe ".execute_diff" do
    it "should do nothing" do
      expect(diff3.execute_diff(["a"], ["a"], ["a"], current_differ)).to eq []
    end

    it "should show no conflict" do
      result = [[:no_conflict_found, 1, 1, 1, 1, 1, 1]]
      expect(diff3.execute_diff(["a"], ["b"], ["a"], current_differ)).to eq result
    end

    it "should show choose right" do
      result = [[:choose_right, 1, 1, 1, 1, 1, 1]]
      expect(diff3.execute_diff(["a"], ["a"], ["b"], current_differ)).to eq result
    end

    it "should show choose left" do
      result = [[:choose_left, 1, 1, 1, 1, 1, 1]]
      expect(diff3.execute_diff(["a"], ["b"], ["b"], current_differ)).to eq result
    end

    it "should show a conflict" do
      result = [[:possible_conflict, 1, 1, 1, 1, 1, 1]]
      expect(diff3.execute_diff(["a"], ["b"], ["c"], current_differ)).to eq result
    end
  end
end