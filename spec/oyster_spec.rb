require 'oyster'

describe Oyster do
  context "when initialized" do
    it "has a default balance" do
      expect(subject.balance).to eq 0
    end
  end
end
