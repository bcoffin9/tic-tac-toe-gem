require "spec_helper"

RSpec.describe Array do
    context "#all_empty?" do
        it "returns true if all elements of the Array are empty" do
            expect(["", "", ""].all_empty?).to be true
        end

        it "returns false if some of the Array elements are not empty" do
            expect(["", 1, ""].all_empty?).to be false
        end

        it "returns true for an empty Array" do
            expect(["", "", ""].all_empty?).to be true
        end
    end

    context "#all_same?" do
        it "returns true if all elements of the Array are same" do
            expect(["A", "A", "A"].all_same?).to be true
        end

        it "returns false if some of the Array elements are not equal" do
        expect(["", 1, ""].all_same?).to be false
        end

        it "returns true for an empty Array" do
        expect([].all_same?).to be true
        end
    end

    context "#any_empty?" do
        it "returns true if any of the values contain nothing" do
            expect(["", "8", "112"].any_empty?).to be true
        end

        it "returns false if all of the values contain something" do
            expect(["12", 54, "my dog"].any_empty?).to be false
        end
    end

    context "#none_empty?" do
        it "returns true if all values contain something" do
            expect([12,33,1].none_empty?).to be true
        end

        it "returns false if at least one value contains something" do
            expect([12,"", ""].none_empty?).to be false
        end
    end
end