puts "Example from the description:"

failures = [
  {candidate_name: 'John Doe', failure_reason: 'Tried to debug with print statements on a whiteboard', interview_date: '2023-01-10'},
  {candidate_name: 'Jane Smith', failure_reason: 'Confused HTML with a programming language', interview_date: '2023-02-14'},
  {candidate_name: 'Bob Brown', failure_reason: 'Pasted Stack Overflow code without understanding it', interview_date: '2023-03-01'},
  {candidate_name: 'Alice Green', failure_reason: 'Used "sudo" in a Java program', interview_date: '2023-04-01'},
  {candidate_name: 'Charlie Black', failure_reason: 'Thought Git was a type of food', interview_date: '2023-05-05'},
  {candidate_name: 'Dave White', failure_reason: 'Wrote an infinite loop in a live coding test', interview_date: '2023-06-15'},
  {candidate_name: 'Eve Blue', failure_reason: 'Claimed to be fluent in binary but spoke in octal', interview_date: '2023-07-20'},
  {candidate_name: 'Alice Smith', failure_reason: 'Claimed to be a Python expert but couldn\'t write a loop', interview_date: '2023-05-01'},
  {candidate_name: 'Jane Smith', failure_reason: 'Tried to fix a bug live and crashed the system', interview_date: '2023-03-14'},
  {candidate_name: 'Dave Brown', failure_reason: 'Claimed to be a Python expert but couldn\'t write a loop', interview_date: '2023-06-15'},
  {candidate_name: 'Stephen Fry', failure_reason: 'Didn\'t know the difference between inner and left joins', interview_date: '2023-06-19'},

]

DB[:interview_failures].multi_insert(failures)

compare_with expected

puts "Bigger test:"

DB[:interview_failures].delete

failures = [
  {candidate_name: 'John Doe', failure_reason: 'Wore pajamas to the interview', interview_date: '2023-01-10'},
  {candidate_name: 'Jane Smith', failure_reason: 'Answered phone mid-interview', interview_date: '2023-02-14'},
  {candidate_name: 'Bob Brown', failure_reason: 'Forgot company\'s name', interview_date: '2023-03-01'},
  {candidate_name: 'Alice Green', failure_reason: 'Brought a pet to the interview', interview_date: '2023-04-01'},
  {candidate_name: 'Charlie Black', failure_reason: 'Fell asleep during interview', interview_date: '2023-05-05'},
  {candidate_name: 'Dave White', failure_reason: 'Showed up intoxicated', interview_date: '2023-06-15'},
  {candidate_name: 'Eve Blue', failure_reason: 'Talked only about personal life', interview_date: '2023-07-20'},
  {candidate_name: 'Frank Yellow', failure_reason: 'Dressed as a superhero', interview_date: '2023-08-10'},
  {candidate_name: 'Grace Pink', failure_reason: 'Tried to bribe the interviewer', interview_date: '2023-09-05'},
  {candidate_name: 'Hank Orange', failure_reason: 'Used excessive slang', interview_date: '2023-10-12'},
  {candidate_name: 'Irene Violet', failure_reason: 'Was extremely late', interview_date: '2023-11-22'},
  {candidate_name: 'Jack Crimson', failure_reason: 'Forgot their own name', interview_date: '2023-12-01'},
  {candidate_name: 'Kelly Teal', failure_reason: 'Talked bad about previous job', interview_date: '2024-01-18'},
  {candidate_name: 'Larry Magenta', failure_reason: 'Yawned continuously', interview_date: '2024-02-25'},
  {candidate_name: 'Mona Lime', failure_reason: 'Kept checking the time', interview_date: '2024-03-30'},
  {candidate_name: 'Nate Olive', failure_reason: 'Brought their mom', interview_date: '2024-04-05'},
  {candidate_name: 'Olive Cyan', failure_reason: 'Insulted the interviewer', interview_date: '2024-05-20'},
  {candidate_name: 'Pete Brown', failure_reason: 'Asked for the interviewer’s job', interview_date: '2024-06-11'},
  {candidate_name: 'Quinn Silver', failure_reason: 'Showed up in costume', interview_date: '2024-07-07'},
  {candidate_name: 'Rita Gold', failure_reason: 'Asked inappropriate questions', interview_date: '2024-08-09'},
  {candidate_name: 'Steve Gray', failure_reason: 'Used excessive slang', interview_date: '2024-08-15'},
  {candidate_name: 'Tina Purple', failure_reason: 'Forgot company\'s name', interview_date: '2024-08-20'},
  {candidate_name: 'Uma Black', failure_reason: 'Wore pajamas to the interview', interview_date: '2024-08-25'},
  {candidate_name: 'Victor White', failure_reason: 'Brought a pet to the interview', interview_date: '2024-08-30'},
  {candidate_name: 'Wendy Blue', failure_reason: 'Talked only about personal life', interview_date: '2024-09-05'},
  {candidate_name: 'Xavier Red', failure_reason: 'Showed up intoxicated', interview_date: '2024-09-10'},
  {candidate_name: 'Yolanda Green', failure_reason: 'Tried to bribe the interviewer', interview_date: '2024-09-15'},
  {candidate_name: 'Zack Brown', failure_reason: 'Fell asleep during interview', interview_date: '2024-09-20'},
  {candidate_name: 'Aaron Indigo', failure_reason: 'Answered phone mid-interview', interview_date: '2024-09-25'},
  {candidate_name: 'Beth Orange', failure_reason: 'Was extremely late', interview_date: '2024-09-30'}
]

DB[:interview_failures].multi_insert(failures)

compare_with expected