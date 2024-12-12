describe "Query tests" do
    DB.create_table(:people) do
      primary_key(:id)
      String(:name)
    end
    DB.create_table(:countries) do
      primary_key(:id)
      String(:name, unique: true)
    end
    DB.create_table(:visits) do
      primary_key(:id)
      foreign_key(:person_id, :people)
      foreign_key(:country_id, :countries)
      Integer(:year)
    end

    it "should work on an example test" do
      DB[:people].multi_insert([
        { name: 'Tim' },
        { name: 'Bob' },
        { name: 'Sally' },
        { name: 'Alex' },
      ])
      DB[:countries].multi_insert([
        { name: 'Great Britain' },
        { name: 'Spain' },
        { name: 'Argentina' },
        { name: 'Montenegro' },
        { name: 'Japan' },
      ])
      DB[:visits].multi_insert([
        { person_id: 1, country_id: 1, year: 2019 },
        { person_id: 1, country_id: 4, year: 2024 },
        { person_id: 2, country_id: 1, year: 2000 },
        { person_id: 2, country_id: 2, year: 2010 },
        { person_id: 2, country_id: 4, year: 2012 },
        { person_id: 2, country_id: 4, year: 2022 },
        { person_id: 2, country_id: 5, year: 2023 },
        { person_id: 3, country_id: 4, year: 2021 },
      ])

      expected = [
        {:name => "Bob", :countries_visited => 4},
        {:name => "Tim", :countries_visited => 2},
        {:name => "Sally", :countries_visited => 1},
        {:name => "Alex", :countries_visited => 0},
      ]
      actual = run_sql.to_a()
      show_diff_table(actual, expected)
      expect(actual).to eq(expected)
    end
  end