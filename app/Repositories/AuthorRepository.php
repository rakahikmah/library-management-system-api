<?php

namespace App\Repositories;
use Illuminate\Support\Facades\Cache;

use App\Models\Book;
use App\Models\Author;

class AuthorRepository
{

    public function all()
    {
        return Author::all();
    }

    public function create(array $data)
    {
        return Author::create($data);
    }

    public function find($id)
    {
    $cacheKey = "author_{$id}";

    return Cache::remember($cacheKey, 60, function () use ($id) {
        return Author::find($id);
    });
    }

    public function update($id, array $data)
    {
        $cacheAuthorKey = "author_{$id}";
        $cacheAuthorWithBookKey = "author_with_books_{$id}";

        if (Cache::has($cacheAuthorKey)) {
            Cache::forget($cacheAuthorKey);
        }

        if (Cache::has($cacheAuthorWithBookKey)) {
            Cache::forget($cacheAuthorWithBookKey);
        }

        $author = Author::find($id);
        if (!$author) {
            return null;
        }
        $author->update($data);
        return $author;
    }

    public function destroy($id)
    {
        $author = Author::find($id);
        if (!$author) {
            return false;
        }
        return $author->delete();
    }

    public function findWithBooks($id)
    {
        $cacheKey = "author_with_books_{$id}";
        return Cache::remember($cacheKey, 60, function () use ($id) {

            return Author::with('books')->findOrFail($id);
        });
    }
}
