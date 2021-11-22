# Project Intro

The purpose of this app is to help groups of housemates manage various house tasks on one convenient platform
These tasks include things such as rent splitting, checking availability of house appliances (dishwasher, laundry, etc.), and keeping track of important house information (passwords) to name a few.
For rent splitting, users will be able to make and request payments through PayPal directly on the app. It can also displays the current user's share of the total expenses of other users in the same house, user can view the exact transaction details, they can also visualize how much each user has spent through a pie chart

* Live Heroku Link
https://obscure-tor-72595.herokuapp.com/

* Routes Description
Home page: /
Users urls: /users, /users/new, /users/create, /users/delete, /users/1, /users/1/edit
Display the sign up page: /signup
Display user login prompt, and check for correct password: /login
Display the bill page: /billing
Display the appliance page: /house_appliance
Display all bills: /billing_detail
Logout: /logout


* DB Schema
Tables:
Name: Users
Columns: integer id, string name, string password, string email, integer house_id
Name: Houses
Columns: integer id, string house_name, integer admin_id
Name: Tasks
Columns: integer id, integer house_id, string task_name, date due_date, boolean complete, integer priority
Name: TaskRecords
Columns: integer id, integer task_id, integer user_id
Name: Appliances
Columns: integer id, string appliance_name, integer house_id , integer user_id
Name: Bills
Columns: integer id, string name, integer amount, date due_date
Name: BillRecords
Columns: integer id, integer bill_id, integer user_id
Associations:
House -> User (One to Many)
House -> Appliance (One to Many)
House -> Task (One to Many)
User -> Appliance (One to Many)
User <-> Bill (Many to Many)
User <-> Task (Many to Many)

* Enable UI or Bootstrap components
Bootstrap: yarn add jquery@3.5.1 bootstrap@3.4.1
Chartkick: yarn add chartkick chart.js  

* Database Name
labapp_development

* How to run the test suite
rails test

* Gems Added
chartkick
faker
bootstrap
awesome_print
# cois166-yourturn
