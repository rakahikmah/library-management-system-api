<?php

namespace Tests\Feature;

use Tests\TestCase;
use App\Models\Author;
use App\Models\Book;
use Illuminate\Foundation\Testing\RefreshDatabase;

class AuthorControllerTest extends TestCase
{
    use RefreshDatabase;


    public function test_can_list_authors(): void
    {
        Author::factory()->count(5)->create();

        $response = $this->getJson('/api/authors');

        $response->assertStatus(200)
                 ->assertJsonCount(5);
    }


    public function test_can_create_author()
    {
        $data = [
            'name' => 'John Doe',
            'bio' => 'test aja',
            'birth_date' => '1990-01-01',
        ];

        $response = $this->postJson('/api/authors', $data);

        $response->assertStatus(201)
                 ->assertJsonFragment(['name' => 'John Doe']);
    }


    public function test_can_show_author()
    {
        $author = Author::factory()->create();

        $response = $this->getJson("/api/authors/{$author->id}");

        $response->assertStatus(200)
                 ->assertJson(['id' => $author->id]);
    }


    public function test_can_update_author()
    {
        $author = Author::factory()->create();

        $data = [
            'name' => 'John Doe',
            'bio' => 'test aja',
            'birth_date' => '1990-01-01',
        ];

        $response = $this->putJson("/api/authors/{$author->id}", $data);

        $response->assertStatus(200)
                 ->assertJsonFragment(['name' => 'John Doe']);
    }


    public function test_can_delete_author()
    {
        $author = Author::factory()->create();

        $response = $this->deleteJson("/api/authors/{$author->id}");

        $response->assertStatus(200)
                 ->assertJson(['message' => 'Author deleted']);

        $this->assertDatabaseMissing('authors', ['id' => $author->id]);
    }

    public function test_can_show_books_by_author()
    {
        $author = Author::factory()->create();

        $books = Book::factory()->count(3)->create([
            'author_id' => $author->id,
        ]);

        $response = $this->getJson("/api/authors/{$author->id}/books");

        $response->assertStatus(200)
                 ->assertJsonCount(3);
    }

    public function test_cannot_create_author_with_invalid_data()
    {
        $data = [
            'name' => '', // empty name
            'bio' => 'test bio',
            'birth_date' => 'invalid-date',
        ];

        $response = $this->postJson('/api/authors', $data);

        $response->assertStatus(422)
                 ->assertJsonValidationErrors(['name', 'birth_date']);
    }


    public function test_cannot_show_nonexistent_author()
    {
        $response = $this->getJson("/api/authors/99999");

        $response->assertStatus(404)
                 ->assertJson(['message' => 'Author not found']);
    }


    public function test_cannot_update_author_with_invalid_data()
    {
        $author = Author::factory()->create();

        $data = [
            'name' => '', // empty name
            'bio' => 'test bio',
            'birth_date' => 'invalid-date',
        ];

        $response = $this->putJson("/api/authors/{$author->id}", $data);

        $response->assertStatus(422)
                 ->assertJsonValidationErrors(['name', 'birth_date']);
    }


    public function test_cannot_update_nonexistent_author()
    {
        $data = [
            'name' => 'John Doe',
            'bio' => 'test bio',
            'birth_date' => '1990-01-01',
        ];

        $response = $this->putJson("/api/authors/99999", $data);

        $response->assertStatus(404)
                 ->assertJson(['message' => 'Author not found']);
    }


    public function test_cannot_delete_nonexistent_author()
    {
        $response = $this->deleteJson("/api/authors/99999");

        $response->assertStatus(404)
                 ->assertJson(['message' => 'Author not found']);
    }

    public function test_cannot_show_books_nonexistent_author()
    {
        $response = $this->getJson("/api/authors/99999/books");

        $response->assertStatus(404)
                 ->assertJson(['message' => 'Author not found']);
    }


    public function test_can_show_empty_books_list()
    {
        $author = Author::factory()->create();

        $response = $this->getJson("/api/authors/{$author->id}/books");

        $response->assertStatus(200)
                 ->assertJsonCount(0);
    }


    public function test_cannot_create_author_with_future_birth_date()
    {
        $data = [
            'name' => 'John Doe',
            'bio' => 'test bio',
            'birth_date' => date('Y-m-d', strtotime('+1 year')),
        ];

        $response = $this->postJson('/api/authors', $data);

        $response->assertStatus(422)
                 ->assertJsonValidationErrors(['birth_date']);
    }


    public function test_cannot_create_author_with_too_long_data()
    {
        $data = [
            'name' => str_repeat('a', 300), // very long name
            'bio' => str_repeat('b', 10000), // very long bio
            'birth_date' => '1990-01-01',
        ];

        $response = $this->postJson('/api/authors', $data);

        $response->assertStatus(422)
                 ->assertJsonValidationErrors(['name', 'bio']);
    }





}
