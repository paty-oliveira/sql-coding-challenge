results = run_sql

describe :query do
  describe :syntax do
    it "should contain SELECT" do
      expect($sql.upcase).to include("SELECT")
    end
    it "should contain WHERE" do
      expect($sql.upcase).to include("WHERE")
    end
   end
  end
  
describe :columns do
    it "should return 4 columns" do
      expect(results.first.keys.count).to eq 4
    end
    
    it "should contain a name column" do
      expect(results.first.keys).to include(:name)
    end
        
    it "should contain an id column" do
      expect(results.first.keys).to include(:id)
    end
    
        it "should contain a quality1 column" do
      expect(results.first.keys).to include(:quality1)
    end
    
            it "should contain a quality2 column" do
      expect(results.first.keys).to include(:quality2)
    end
  end
