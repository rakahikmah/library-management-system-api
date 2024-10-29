<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthorController;
use App\Http\Controllers\BookController;


Route::apiResource('authors', AuthorController::class);
Route::get('/authors/{id}/books', [AuthorController::class, 'getBooksByAuthor']);
Route::apiResource('books', BookController::class);
