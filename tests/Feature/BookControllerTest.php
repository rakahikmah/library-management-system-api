<?php

namespace Tests\Feature;

use Tests\TestCase;
use App\Models\Book;
use App\Models\Author;
use Illuminate\Foundation\Testing\RefreshDatabase;

class BookControllerTest extends TestCase
{
    use RefreshDatabase;


    public function test_can_list_books(): void
    {
        Book::factory()->count(5)->create();

        $response = $this->getJson('/api/books');

        $response->assertStatus(200)
                 ->assertJsonCount(5);
    }


    public function test_can_create_book()
    {

        $author = Author::factory()->create();
        $data = [
            "title"=> "Store Book",
            "description" => "Test",
            "publish_date" => "2024-01-21",
            "author_id" => $author->id,
        ];

        $response = $this->postJson('/api/books', $data);

        $response->assertStatus(201)
                 ->assertJsonFragment(['title' => 'Store Book']);
    }


    public function test_can_show_book()
    {
        $book = Book::factory()->create();

        $response = $this->getJson("/api/books/{$book->id}");

        $response->assertStatus(200)
                 ->assertJson(['id' => $book->id]);
    }


    public function test_can_update_book()
    {
        $book = Book::factory()->create();
        $author = Author::factory()->create();

        $data = [
            "title"=> "Store Book",
            "description" => "Test",
            "publish_date" => "2024-01-21",
            "author_id" => $author->id,
        ];

        $response = $this->putJson("/api/books/{$book->id}", $data);

        $response->assertStatus(200)
                 ->assertJsonFragment(['title' => 'Store Book']);
    }


    public function test_can_delete_book()
    {
        $book = Book::factory()->create();

        $response = $this->deleteJson("/api/books/{$book->id}");

        $response->assertStatus(200)
                 ->assertJson(['message' => 'Book deleted']);

        $this->assertDatabaseMissing('books', ['id' => $book->id]);
    }

    public function test_cannot_create_book_with_invalid_data()
    {
        $data = [
            "title" => "",
            "description" => "Test",
            "publish_date" => "invalid-date",
            "author_id" => 9999,
        ];

        $response = $this->postJson('/api/books', $data);

        $response->assertStatus(422)
                 ->assertJsonValidationErrors(['title', 'publish_date', 'author_id']);
    }


    public function test_cannot_show_non_existent_book()
    {
        $response = $this->getJson('/api/books/9999');

        $response->assertStatus(404)
                 ->assertJson(['message' => 'Book not found']);
    }


    public function test_cannot_update_book_with_invalid_data()
    {
        $book = Book::factory()->create();
        $data = [
            "title" => "",
            "description" => "Updated description",
            "publish_date" => "invalid-date",
        ];

        $response = $this->putJson("/api/books/{$book->id}", $data);

        $response->assertStatus(422)
                 ->assertJsonValidationErrors(['title', 'publish_date']);
    }


    public function test_cannot_update_non_existent_book()
    {

        $author = Author::factory()->create();

        $data = [
            "title" => "New Title",
            "description" => "Updated description",
            "publish_date" => "2024-01-21",
            "author_id" => $author->id,
        ];

        $response = $this->putJson('/api/books/9999', $data);

        $response->assertStatus(404)
                 ->assertJson(['message' => 'Book not found']);
    }



    public function test_cannot_delete_non_existent_book()
    {
        $response = $this->deleteJson('/api/books/9999'); // Non-existent book

        $response->assertStatus(404)
                 ->assertJson(['message' => 'Book not found']);
    }


}
