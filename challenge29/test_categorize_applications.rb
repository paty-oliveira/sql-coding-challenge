puts "Example from the description:"

applications = DB[:applications]
applications.insert(application_status: 3)  # Rejected
applications.insert(application_status: 6)  # Approved
applications.insert(application_status: 4)  # Rejected
applications.insert(application_status: 7)  # Approved
applications.insert(application_status: 5)  # Rejected
applications.insert(application_status: 8)  # Approved
applications.insert(application_status: 2)  # Rejected
applications.insert(application_status: 9)  # Approved

compare_with expected

puts "Both categories have zero count:"

DB[:applications].delete

compare_with expected