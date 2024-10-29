<?php

namespace App\Http\Controllers;

use App\Http\Requests\AuthorRequest;
use App\Repositories\AuthorRepository;
use Exception;
use Illuminate\Database\Eloquent\ModelNotFoundException;

class AuthorController extends Controller
{
    protected $authorRepository;

    public function __construct(AuthorRepository $authorRepository)
    {
        $this->authorRepository = $authorRepository;
    }
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        try {
            $authors = $this->authorRepository->all();
            return response()->json($authors, 200);
        } catch (\Illuminate\Validation\ValidationException $e) {
            return response()->json([
                'message' => 'Failed to retrieve authors.',
                'error' => $e->getMessage()
            ], 500);
        }
    }


    /**
     * Store a newly created resource in storage.
     */
    public function store(AuthorRequest $request)
    {
        try {
            $author = $this->authorRepository->create($request->validated());
            return response()->json($author, 201);
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
            $author = $this->authorRepository->find($id);

            if (!$author) {
                return response()->json(['message' => 'Author not found'], 404);
            }

            return response()->json($author, 200);
        } catch (Exception $e) {
            return response()->json(['message' => 'An error occurred while fetching the author.', 'error' => $e->getMessage()], 500);
        }
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(AuthorRequest $request, $id)
    {
        try {
            $author = $this->authorRepository->update($id, $request->validated());

            if (!$author) {
                return response()->json(['message' => 'Author not found'], 404);
            }

            return response()->json($author, 200);
        } catch (Exception $e) {
            return response()->json(['message' => 'An error occurred while updating the author.', 'error' => $e->getMessage()], 500);
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        try {
            $deleted = $this->authorRepository->destroy($id);

            if (!$deleted) {
                return response()->json(['message' => 'Author not found'], 404);
            }

            return response()->json(['message' => 'Author deleted'], 200);
        } catch (Exception $e) {
            return response()->json(['message' => 'An error occurred while deleting the author.', 'error' => $e->getMessage()], 500);
        }
    }

    public function getBooksByAuthor($id)
    {
        try {
            $author = $this->authorRepository->findWithBooks($id);

            $books = $author->books()->with('author')->get();

            return response()->json($books, 200);
        } catch (ModelNotFoundException $e) {
            return response()->json([
                'message' => 'Author not found'
            ], 404);
        } catch (Exception $e) {
            return response()->json([
                'message' => 'An error occurred.',
                'error' => $e->getMessage()
            ], 500);
        }
    }
}
