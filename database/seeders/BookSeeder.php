<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Book;
use App\Models\Author;
use Faker\Factory as Faker;

class BookSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $faker = Faker::create();

        $authors = Author::all();


        if ($authors->isEmpty()) {
            $this->command->warn('No authors found. Please run AuthorSeeder first.');
            return;
        }

        foreach (range(1, 10) as $index) {
            Book::create([
                'title' => $faker->sentence(3),
                'description' => $faker->paragraph,
                'publish_date' => $faker->date,
                'author_id' => $authors->random()->id,
            ]);
        }
    }
}
