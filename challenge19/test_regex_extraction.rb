results = run_sql

describe :items do
  it "should return 3 columns" do
    expect(results.first.keys.count).to eq 3
  end
  
  it "should have the correct column names" do
    expect(results.columns[0].to_s).to eq "name"
    expect(results.columns[1].to_s).to eq "greeting"
    expect(results.columns[2].to_s).to eq "user_id"
  end  
  
end