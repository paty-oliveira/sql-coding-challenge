DB[:products].multi_insert([
  {:name => "milk", :price => 3.50},
  {:name => "cheese", :price => 5.60},
  {:name => "eggs", :price => 2.00}
])
DB[:sales].multi_insert([
  {:date => "2018-12-31"},
  {:date => "2019-01-01"},
  {:date => "2019-02-01"},
  {:date => "2019-01-02"}
])
DB[:sales_details].multi_insert([
  {:sale_id => 1, :product_id => 1, :count => 3},
  {:sale_id => 1, :product_id => 3, :count => 1},
  {:sale_id => 2, :product_id => 1, :count => 2},
  {:sale_id => 2, :product_id => 2, :count => 1},
  {:sale_id => 3, :product_id => 3, :count => 3},
  {:sale_id => 3, :product_id => 2, :count => 2},
  {:sale_id => 4, :product_id => 1, :count => 1},
  {:sale_id => 4, :product_id => 2, :count => 1},
  {:sale_id => 4, :product_id => 3, :count => 3}
])

expected = [
  {:product_name => "cheese", :year => 2019, :month => 1, :day => 1, :total => 5.6},
  {:product_name => "cheese", :year => 2019, :month => 1, :day => 2, :total => 5.6},
  {:product_name => "cheese", :year => 2019, :month => 1, :day => nil, :total => 11.2},
  {:product_name => "cheese", :year => 2019, :month => 2, :day => 1, :total => 11.2},
  {:product_name => "cheese", :year => 2019, :month => 2, :day => nil, :total => 11.2},
  {:product_name => "cheese", :year => 2019, :month => nil, :day => nil, :total => 22.4},
  {:product_name => "cheese", :year => nil, :month => nil, :day => nil, :total => 22.4},
  {:product_name => "eggs", :year => 2018, :month => 12, :day => 31, :total => 2.0},
  {:product_name => "eggs", :year => 2018, :month => 12, :day => nil, :total => 2.0},
  {:product_name => "eggs", :year => 2018, :month => nil, :day => nil, :total => 2.0},
  {:product_name => "eggs", :year => 2019, :month => 1, :day => 2, :total => 6.0},
  {:product_name => "eggs", :year => 2019, :month => 1, :day => nil, :total => 6.0},
  {:product_name => "eggs", :year => 2019, :month => 2, :day => 1, :total => 6.0},
  {:product_name => "eggs", :year => 2019, :month => 2, :day => nil, :total => 6.0},
  {:product_name => "eggs", :year => 2019, :month => nil, :day => nil, :total => 12.0},
  {:product_name => "eggs", :year => nil, :month => nil, :day => nil, :total => 14.0},
  {:product_name => "milk", :year => 2018, :month => 12, :day => 31, :total => 10.5},
  {:product_name => "milk", :year => 2018, :month => 12, :day => nil, :total => 10.5},
  {:product_name => "milk", :year => 2018, :month => nil, :day => nil, :total => 10.5},
  {:product_name => "milk", :year => 2019, :month => 1, :day => 1, :total => 7.0},
  {:product_name => "milk", :year => 2019, :month => 1, :day => 2, :total => 3.5},
  {:product_name => "milk", :year => 2019, :month => 1, :day => nil, :total => 10.5},
  {:product_name => "milk", :year => 2019, :month => nil, :day => nil, :total => 10.5},
  {:product_name => "milk", :year => nil, :month => nil, :day => nil, :total => 21.0}
]

describe "Sample tests" do
  compare(run_sql(print: false).to_a, expected, "Tests")
end