<?php

namespace App\Http\Controllers;

use App\Models\Book;
use App\Http\Requests\BookRequest;
use App\Repositories\BookRepository;
use Exception;
class BookController extends Controller
{
    protected $bookRepository;

    public function __construct(BookRepository $bookRepository)
    {
        $this->bookRepository = $bookRepository;
    }
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        try {
            $books = $this->bookRepository->all();
            return response()->json($books, 200);
        } catch (\Illuminate\Validation\ValidationException $e) {
            return response()->json([
                'message' => 'Failed to retrieve Books.',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(BookRequest $request)
    {
        try {
            $book = $this->bookRepository->create($request->validated());
            return response()->json($book, 201);
        } catch (\Illuminate\Validation\ValidationException $e) {
            return response()->json([
                'message' => 'Validation failed',
                'errors' => $e->errors()
            ], 422);
        }
    }


    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        try {
            $book = $this->bookRepository->find($id);

            if (!$book) {
                return response()->json(['message' => 'Book not found'], 404);
            }

            return response()->json($book, 200);
        } catch (Exception $e) {
            return response()->json(['message' => 'An error occurred while fetching the author.', 'error' => $e->getMessage()], 500);
        }
    }


    /**
     * Update the specified resource in storage.
     */
    public function update(BookRequest $request, $id)
    {
        try {
            $book = $this->bookRepository->find($id);

            if (!$book) {
                return response()->json(['message' => 'Book not found'], 404);
            }

            // Lanjutkan update jika buku ditemukan
            $updatedBook = $this->bookRepository->update($id, $request->validated());

            return response()->json($updatedBook, 200);
        } catch (Exception $e) {
            return response()->json(['message' => 'An error occurred while updating the book.', 'error' => $e->getMessage()], 500);
        }
    }


    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        try {
            $deleted = $this->bookRepository->destroy($id);

            if (!$deleted) {
                return response()->json(['message' => 'Book not found'], 404);
            }

            return response()->json(['message' => 'Book deleted'], 200);
        } catch (Exception $e) {
            return response()->json(['message' => 'An error occurred while deleting the book.', 'error' => $e->getMessage()], 500);
        }
    }

}
