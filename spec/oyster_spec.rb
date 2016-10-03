require 'oyster'

describe Oyster do
  context "when initialized" do
    it "has a default balance" do
      expect(subject.balance).to eq 0
    end
  end

  describe "#top_up" do
    context "when given a value" do
      it "adds value to balance" do
        subject.balance = 0
        expect(subject.top_up(10)).to eq 10
      end
    end
  end
end
