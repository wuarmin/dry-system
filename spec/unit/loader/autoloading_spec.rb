# frozen_string_literal: true

require "dry/system/loader/autoloading"

RSpec.describe Dry::System::Loader::Autoloading do
  describe "#require!" do
    subject(:loader) { described_class.new("test/bar") }

    before do
      allow(loader).to receive(:require)
      allow(Test).to receive(:const_missing)
    end

    it "loads the constant " do
      loader.require!
      expect(loader).not_to have_received(:require)
      expect(Test).to have_received(:const_missing).with :Bar
    end

    it "returns self" do
      expect(loader.require!).to eql loader
    end
  end
end