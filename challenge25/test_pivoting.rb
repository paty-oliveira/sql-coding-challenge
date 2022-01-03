compare_with expected do
    spec do
      it "should contain CROSSTAB" do
        expect($sql.upcase).to include("CROSSTAB")
      end

      it "should contain CREATE EXTENSION TABLEFUNC" do
        expect($sql.upcase).to include("CREATE EXTENSION TABLEFUNC")
      end
    end
  end