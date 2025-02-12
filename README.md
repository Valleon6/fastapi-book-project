# FastAPI Book Management API

## Overview

This project is a RESTful API built with FastAPI for managing a book collection. It provides comprehensive CRUD (Create, Read, Update, Delete) operations for books with proper error handling, input validation, and documentation.

## Features

	•	📚 Book management (CRUD operations)
	•	✅ Input validation using Pydantic models
	•	🔍 Enum-based genre classification
	•	🧪 Complete test coverage with pytest
	•	📝 API documentation (auto-generated by FastAPI)
	•	🔒 CORS middleware enabled for cross-origin requests
	•	💥 Error handling for invalid data and non-existent books

## Project Structure

```
fastapi-book-project/
├── api/
│   ├── db/
│   │   ├── __init__.py
│   │   └── schemas.py      # Data models and in-memory database
│   ├── routes/
│   │   ├── __init__.py
│   │   └── books.py        # Book route handlers
│   └── router.py           # API router configuration
├── core/
│   ├── __init__.py
│   └── config.py           # Application settings
├── tests/
│   ├── __init__.py
│   └── test_books.py       # API endpoint tests
├── main.py                 # Application entry point
├── requirements.txt        # Project dependencies
└── README.md
```

## Technologies Used

- Python 3.12
- FastAPI
- Pydantic
- pytest
- uvicorn

## Installation

1. Clone the repository:

1. Clone the repository

git clone https://github.com/hng12-devbotops/fastapi-book-project.git
cd fastapi-book-project

2. Create a virtual environment:

```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

3. Install dependencies:

```bash
pip install -r requirements.txt
```

## Running the Application

1. Start the server:

To run the application locally:

1. Start the FastAPI server
uvicorn main:app --reload

This will start the server on http://localhost:8000

2. Access the API documentation
	•	Swagger UI: http://localhost:8000/docs
	•	ReDoc: http://localhost:8000/redoc

API Endpoints

Books
	•	GET /api/v1/books/ - Get all books
	•	GET /api/v1/books/{book_id} - Get a specific book
	•	POST /api/v1/books/ - Create a new book
	•	PUT /api/v1/books/{book_id} - Update a book
	•	DELETE /api/v1/books/{book_id} - Delete a book

### Health Check

- `GET /healthcheck` - Check API status

## Book Schema

```json
{
  "id": 1,
  "title": "Book Title",
  "author": "Author Name",
  "publication_year": 2024,
  "genre": "Fantasy"
}
```

Available genres:

- Science Fiction
- Fantasy
- Horror
- Mystery
- Romance
- Thriller

## Running Tests

```bash
pytest
```

## Error Handling

The API includes proper error handling for:

	•	Non-existent books (404 error)
	•	Invalid book IDs (400 error)
	•	Invalid genre types (400 error)
	•	Malformed requests (400 error)

## Contributing

To contribute to this project:
	1.	Fork the repository
	2.	Create a feature branch (git checkout -b feature/AmazingFeature)
	3.	Commit your changes (git commit -m 'Add AmazingFeature')
	4.	Push to the branch (git push origin feature/AmazingFeature)
	5.	Open a pull request

Deployment Instructions

To deploy the application to production, follow these steps:

1. Dockerize the Application

Ensure the project is dockerized with a Dockerfile. If you don’t have one, here’s a basic one for FastAPI:

FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]

2. Build the Docker Image

docker build -t fastapi-book-api .

3. Run the Docker Container

docker run -d -p 8000:8000 fastapi-book-api

Now, your API should be running on http://localhost:8000.

4. (Optional) Deploy to a Cloud Provider
	•	If deploying to AWS, GCP, or Azure, ensure the required environment variables and networking settings are configured.
	•	Set up a CI/CD pipeline using GitHub Actions or a similar tool for automatic deployment.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

For support, please open an issue in the GitHub repository.
