-- Enable the uuid-ossp extension if not already enabled
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Create companions table
CREATE TABLE companions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name TEXT NOT NULL,
    author TEXT NOT NULL, -- Clerk userId
    subject TEXT NOT NULL,
    topic TEXT NOT NULL,
    voice TEXT NOT NULL,
    style TEXT NOT NULL,
    duration INTEGER NOT NULL,
    image_url TEXT,
    bio TEXT,
    instruction TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create session_history table
CREATE TABLE session_history (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    companion_id UUID REFERENCES companions(id) ON DELETE CASCADE,
    user_id TEXT NOT NULL, -- Clerk userId
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create bookmarks table
CREATE TABLE bookmarks (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    companion_id UUID REFERENCES companions(id) ON DELETE CASCADE,
    user_id TEXT NOT NULL, -- Clerk userId
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    UNIQUE(companion_id, user_id)
);

-- Enable Row Level Security (RLS)
ALTER TABLE companions ENABLE ROW LEVEL SECURITY;
ALTER TABLE session_history ENABLE ROW LEVEL SECURITY;
ALTER TABLE bookmarks ENABLE ROW LEVEL SECURITY;

-- Add policies (Simplified for setup, restrict as needed)
CREATE POLICY "Allow public read on companions" ON companions FOR SELECT USING (true);
CREATE POLICY "Allow authenticated insert on companions" ON companions FOR INSERT WITH CHECK (auth.role() = 'authenticated');

CREATE POLICY "Allow users to see their own session history" ON session_history FOR SELECT USING ((auth.jwt() ->> 'sub') = user_id);
CREATE POLICY "Allow users to insert their own session history" ON session_history FOR INSERT WITH CHECK ((auth.jwt() ->> 'sub') = user_id);

CREATE POLICY "Allow users to see their own bookmarks" ON bookmarks FOR SELECT USING ((auth.jwt() ->> 'sub') = user_id);
CREATE POLICY "Allow users to manage their own bookmarks" ON bookmarks FOR ALL USING ((auth.jwt() ->> 'sub') = user_id);
