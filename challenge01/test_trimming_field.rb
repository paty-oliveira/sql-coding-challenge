results = run_sql

describe :query do
  describe "should contain keywords" do
    it "should contain SELECT" do
      expect($sql.upcase).to include("SELECT")
    end

    it "should contain FROM" do
      expect($sql.upcase).to include("FROM")
    end

    it "should contain ORDER BY id" do
      expect($sql.upcase).to include("ORDER BY ID")
    end
  end

  describe :columns do
    it "should return 3 columns" do
      expect(results.first.keys.count).to eq 3
    end

    it "should return an id column" do
      expect(results.first.keys).to include(:id)
    end

    it "should return a name column" do
      expect(results.first.keys).to include(:name)
    end

    it "should return a characteristic column" do
      expect(results.first.keys).to include(:characteristic)
    end
 end
end