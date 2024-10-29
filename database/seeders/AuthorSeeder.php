<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Author;
use Faker\Factory as Faker;

class AuthorSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $faker = Faker::create();

        foreach (range(1, 10) as $index) {
            Author::create([
                'name' => $faker->name,
                'bio' => $faker->paragraph,
                'birth_date' => $faker->date,
            ]);
        }
    }
}
