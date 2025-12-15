-- Run this in Supabase SQL Editor at: https://supabase.com/dashboard/project/pkbcifdmebszcrpmlhxm/sql/new

-- Create the leaderboard table
CREATE TABLE IF NOT EXISTS sheetman_leaderboard (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    score INTEGER NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Enable Row Level Security
ALTER TABLE sheetman_leaderboard ENABLE ROW LEVEL SECURITY;

-- Allow anyone to read the leaderboard
CREATE POLICY "Allow public read" ON sheetman_leaderboard
    FOR SELECT USING (true);

-- Allow anyone to insert scores
CREATE POLICY "Allow public insert" ON sheetman_leaderboard
    FOR INSERT WITH CHECK (true);

-- Create index for faster sorting
CREATE INDEX IF NOT EXISTS idx_sheetman_score ON sheetman_leaderboard(score DESC);
