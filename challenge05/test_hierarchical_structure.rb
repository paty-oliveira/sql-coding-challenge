compare_with expected do
    spec do
      it "should contain WITH" do
        expect($sql.upcase).to include("WITH")
      end
          
      it "should contain RECURSIVE" do
        expect($sql.upcase).to include("RECURSIVE")
      end
    end
  end