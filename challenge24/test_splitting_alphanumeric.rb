results = run_sql

describe :query do
  describe "should contain keywords" do
    it "should contain SELECT" do
      expect($sql.upcase).to include("SELECT")
    end

    it "should contain FROM" do
      expect($sql.upcase).to include("FROM")
    end
  end

  describe :columns do
    it "should return 3 columns" do
      expect(results.first.keys.count).to eq 3
    end

    it "should return a project column" do
      expect(results.first.keys).to include(:project)
    end

    it "should return a letters column" do
      expect(results.first.keys).to include(:letters)
    end

    it "should return a numbers column" do
      expect(results.first.keys).to include(:numbers)
    end
  end
end