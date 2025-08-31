-- Initialize authentication database
PRAGMA foreign_keys = ON;

-- Users table (single user system) - prefixed with codexcliui_ to avoid conflicts
CREATE TABLE IF NOT EXISTS codexcliui_users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    last_login DATETIME,
    is_active BOOLEAN DEFAULT 1
);

-- Indexes for performance
CREATE INDEX IF NOT EXISTS idx_codexcliui_users_username ON codexcliui_users(username);
CREATE INDEX IF NOT EXISTS idx_codexcliui_users_active ON codexcliui_users(is_active);