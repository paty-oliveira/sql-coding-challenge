compare_with expected do
    rows do
      it "should be sorted alphabetically" do
        expect(actual.first[:title]).to be < actual.last[:title]
      end
    end
  end