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
        before = subject.balance
        expect(subject.top_up(10)).to eq before + 10
      end
    end

    context "when value given exceeds the limit" do
      it "raises an error" do
        subject.top_up(90)
        expect{subject.top_up(1)}.to raise_error "Amount exceeds limit of: 90"
      end
    end
  end

  describe "#deduct" do
    context "when paying for a journey" do
      it "deducts money" do
        before = subject.top_up(30)
        expect(subject.deduct(10)).to eq before - 10
      end
    end
    
    context "when deducting below 0" do
      it "raises an error" do
        expect{subject.deduct(1)}.to raise_error "Cannot enter minus zones"
      end
    end
  end
end
