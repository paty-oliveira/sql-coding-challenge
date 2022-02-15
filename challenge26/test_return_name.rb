results = run_sql

describe :query do
  describe "should contain keywords" do
    it "should contain SELECT" do
      expect($sql.upcase).to include("SELECT")
    end

    it "should contain FROM" do
      expect($sql.upcase).to include("FROM")
    end

    it "should contain Hello" do
      expect($sql).to include("Hello")
    end
  end

  describe :columns do
    it "should return 1 column" do
      expect(results.first.keys.count).to eq 1
    end
    it "should return a greeting column" do
      expect(results.first.keys).to include(:greeting)
    end
  end
end