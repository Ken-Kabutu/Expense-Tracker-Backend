# Expense Tracker Backend

This is the backend repository for the Expense Tracker app, a full-stack web application for tracking expenses. The backend is built using Ruby on Rails and provides RESTful API endpoints for user management, expense creation, and more.

## Getting Started

Follow the steps below to set up and run the backend of the Expense Tracker app:

### Prerequisites

- Ruby (version 2.7.4p191)
- Rails (version  7.0.7)
- PostgreSQL (version 14.9)

### Installation

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/Ken-Kabutu/expense-tracker-backend.git

2. Change into the project directory:

   ```bash
   cd expense-tracker-backend

3. Install gem dependencies:

   ```bash
   bundle install

4. Create and migrate the database:

   ```bash
   rails db:create
   rails db:migrate

5. Start the Rails server:

   ```bash
   rails server


### API Endpoints

* User Registration: 'POST /api/users'
* User Login: 'POST /api/login'
* User Logout: 'DELETE /api/logout'
* Create Expense: 'POST /api/expenses'
* List Expenses: 'GET /api/expenses'

### Author


* Kenneth Wachira
* Maimunar omar
* Alfred kimata
* Faith Kamau
* Isaiah Sikobe


### License

This project is licensed under the MIT License.

### Frontend Repo

* https://github.com/Ken-Kabutu/Expense-Tracker-Frontend
