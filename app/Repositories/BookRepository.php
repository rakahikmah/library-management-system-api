<?php

namespace App\Repositories;

use App\Models\Book;
use Illuminate\Support\Facades\Cache;
class BookRepository
{

    public function all()
    {
        return Book::all();
    }

    public function create(array $data)
    {
        return Book::create($data);
    }

    public function find($id)
    {
        $cacheKey = "book_{$id}";

        return Cache::remember($cacheKey, 60, function () use ($id) {
            return Book::find($id);
        });
    }

    public function update($id, array $data)
    {
        $cacheKey = "book_{$id}";

        if (Cache::has($cacheKey)) {
            Cache::forget($cacheKey);
        }

        $book = Book::find($id);

        $cacheAuthorWithBookKey = "author_with_books_{$book->author_id}";

        if (Cache::has($cacheAuthorWithBookKey)) {
            Cache::forget($cacheAuthorWithBookKey);
        }

        if (!$book) {
            return null;
        }

        $book->update($data);
        return $book;
    }

    public function destroy($id)
    {
        $book = Book::find($id);
        if (!$book) {
            return false;
        }
        return $book->delete();
    }
}
