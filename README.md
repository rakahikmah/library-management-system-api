
# Library Management System

This project is a library management system that provides a RESTful API to manage books and authors. It allows users to perform various operations such as creating, reading, updating, and deleting (CRUD) records for both books and authors. The API is designed to be simple, structured, and easy to integrate with frontend applications or other services.

## Features  
- **CRUD operations** for books and authors.  
- Each book can be linked with one or more authors.  
- Retrieve lists of books and authors with filtering options.  
- Endpoints for fetching detailed information about a specific book or author.  





## Tech Stack

**Programming Language:** PHP 8.2, Laravel 11x

**Database:** MySQL

**Web Server Development :** Laragon


## Installation

1. clone or download from github

2. Import database sql in folder **./dumpmysql**, create schema with name 'altech-omega-andalan' and 'altech-omega-andalan-test' with 2 schema and you can import to MySQL  

3. And you can config in file .env and .env.testing you can setting with your environment like example

**.env**
```bash
    DB_CONNECTION=mysql
    DB_HOST=127.0.0.1
    DB_PORT=3306
    DB_DATABASE=altech-omega-andalan
    DB_USERNAME=root
    DB_PASSWORD=
```

**.env-testing** 
```bash
    DB_CONNECTION=mysql
    DB_HOST=127.0.0.1
    DB_PORT=3306
    DB_DATABASE=altech-omega-andalan-test
    DB_USERNAME=root
    DB_PASSWORD=
```

4. Run composer install
```bash
composer install
```

5. Generate the application key
```bash
php artisan key:generate
```

6. Migrate Database (Optional if you haven't not import sql to mysql)
```bash
php artisan migrate
```

7. Running Application
```bash
php artisan migrate
```

8. For run URL API with tools in case i use postman an you can import my collection the name file collection is **./Test-Altech-Omega-Andalan.postman_collection**

9. This project utilizes Laravel built-in **DB Seeder** to generate fake data for testing purposes. You can run the following command to populate the database with sample data:
```bash
php artisan db:seed
```

10 In This case for Unit Testing I use PHPUnit you can run unit testing with command 
```bash
php artisan test
```

# Library Management System API - Authors

## Authors Endpoints

| **Method** | **Endpoint**                            | **Description**                 | **Request Body Fields**                                                                                      |
|------------|------------------------------------------|---------------------------------|--------------------------------------------------------------------------------------------------------------|
| GET        | `http://localhost:8000/api/authors`      | Retrieve all authors            | Not required                                                                                                 |
| GET        | `http://localhost:8000/api/authors/{id}` | Retrieve a specific author      | Not required                                                                                                 |
| GET        | `http://localhost:8000/api/authors/{id}/books` | Retrieve all books by the author | Not required                                                                                                 |
| POST       | `http://localhost:8000/api/authors`      | Create a new author             | - **name** (required) <br> - **bio** (optional) <br> - **birth_date** (date, required)       |
| PUT        | `http://localhost:8000/api/authors/{id}` | Update an existing author       | - **name** (optional) <br> - **bio** (optional) <br> - **birth_date** (date, optional)       |
| DELETE     | `http://localhost:8000/api/authors/{id}` | Delete an author                | Not required                                                                                                 |

---

# Library Management System API - Books

## Books Endpoints

| **Method** | **Endpoint**                         | **Description**                | **Request Body Fields**                                                                                      |
|------------|--------------------------------------|--------------------------------|--------------------------------------------------------------------------------------------------------------|
| GET        | `http://localhost:8000/api/books`     | Retrieve all books             | Not required                                                                                                 |
| GET        | `http://localhost:8000/api/books/{id}`| Retrieve a specific book       | Not required                                                                                                 |
| POST       | `http://localhost:8000/api/books`     | Create a new book              | - **title** (string, required) <br> - **description** (string, required) <br> - **publish_date** (date, required) <br> - **author_id** (integer, required) |
| PUT        | `http://localhost:8000/api/books/{id}`| Update an existing book        | - **title** (string , required) <br> - **description** (string , required) <br> - **publish_date** (date) <br> - **author_id** (integer, required) |
| DELETE     | `http://localhost:8000/api/books/{id}`| Delete a book                  | Not required                                                                                                 |



## Best Practices Implementation  

In this project, several **Laravel best practices** are implemented, both in terms of code structure and design patterns, including:  

1. **Repository Pattern**  
   The repository pattern is used to separate the business logic from the data access logic. In this project, the repository pattern is applied to the **Book** and **Author** models, ensuring that data access logic is isolated and reusable, which makes the code cleaner and easier to maintain.  

2. **Form Request**  
   Laravel **Form Request** is used to handle validation logic when storing data. This ensures that the validation rules are kept separate from the controller, making the code more organized and reusable, while also improving readability and maintainability.  

3. **Cache for Show Data**  
   Caching is used to optimize the process of displaying detailed information for books, authors, and their associations. By storing frequently accessed data in cache, the system reduces database queries and improves performance.  

4. **ORM and Eager Loading**  
   This project utilizes **Eloquent ORM** and **eager loading** to efficiently manage relationships between models. Eager loading ensures that related data is loaded in fewer queries, improving performance by preventing the N+1 query problem.  

