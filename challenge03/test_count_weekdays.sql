run_sql

describe "tests" do
  describe "SQL Statement" do
    it "should contain CREATE" do
      expect($sql.upcase).to include("CREATE")
    end
    
    it "should contain FUNCTION" do
      expect($sql.upcase).to include("FUNCTION")
    end
    it "should contain weekdays" do
      expect($sql).to include("weekdays")
    end
    it "should contain RETURNS" do
      expect($sql.upcase).to include("RETURNS")
    end
    it "should contain INTEGER" do
      expect($sql.upcase).to include("INTEGER")
    end
  end  
end
