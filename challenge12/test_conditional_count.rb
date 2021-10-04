compare_with expected do
    rows do
      it "should be sorted from earliest to latest" do
        expect(actual.first[:month]).to be < actual.last[:month]
      end
    end
  end