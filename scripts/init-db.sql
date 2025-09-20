-- CryptoMiningHub Database Initialization Script

-- Create extensions
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "pg_trgm";

-- Users table
CREATE TABLE IF NOT EXISTS users (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    email VARCHAR(255) UNIQUE NOT NULL,
    username VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    is_active BOOLEAN DEFAULT true,
    is_verified BOOLEAN DEFAULT false,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Mining rigs table
CREATE TABLE IF NOT EXISTS mining_rigs (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES users(id) ON DELETE CASCADE,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    status VARCHAR(50) DEFAULT 'offline', -- online, offline, error, maintenance
    hash_rate DECIMAL(20, 2) DEFAULT 0,
    power_consumption DECIMAL(10, 2) DEFAULT 0,
    temperature DECIMAL(5, 2) DEFAULT 0,
    uptime_percentage DECIMAL(5, 2) DEFAULT 0,
    last_seen TIMESTAMP WITH TIME ZONE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Mining pools table
CREATE TABLE IF NOT EXISTS mining_pools (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(255) NOT NULL,
    url VARCHAR(500) NOT NULL,
    port INTEGER NOT NULL,
    username VARCHAR(255),
    password VARCHAR(255),
    algorithm VARCHAR(100),
    currency VARCHAR(10),
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Mining statistics table
CREATE TABLE IF NOT EXISTS mining_statistics (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    rig_id UUID REFERENCES mining_rigs(id) ON DELETE CASCADE,
    pool_id UUID REFERENCES mining_pools(id) ON DELETE CASCADE,
    hash_rate DECIMAL(20, 2) NOT NULL,
    shares_accepted INTEGER DEFAULT 0,
    shares_rejected INTEGER DEFAULT 0,
    shares_stale INTEGER DEFAULT 0,
    temperature DECIMAL(5, 2),
    power_consumption DECIMAL(10, 2),
    earnings DECIMAL(20, 8) DEFAULT 0,
    recorded_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Cryptocurrencies table
CREATE TABLE IF NOT EXISTS cryptocurrencies (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    symbol VARCHAR(10) UNIQUE NOT NULL,
    name VARCHAR(255) NOT NULL,
    current_price DECIMAL(20, 8),
    market_cap DECIMAL(20, 2),
    volume_24h DECIMAL(20, 2),
    price_change_24h DECIMAL(10, 4),
    price_change_percentage_24h DECIMAL(10, 4),
    last_updated TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- User portfolios table
CREATE TABLE IF NOT EXISTS user_portfolios (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES users(id) ON DELETE CASCADE,
    crypto_id UUID REFERENCES cryptocurrencies(id) ON DELETE CASCADE,
    quantity DECIMAL(20, 8) NOT NULL DEFAULT 0,
    average_buy_price DECIMAL(20, 8),
    total_invested DECIMAL(20, 2) DEFAULT 0,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(user_id, crypto_id)
);

-- Transactions table
CREATE TABLE IF NOT EXISTS transactions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES users(id) ON DELETE CASCADE,
    crypto_id UUID REFERENCES cryptocurrencies(id) ON DELETE CASCADE,
    type VARCHAR(20) NOT NULL, -- buy, sell, mining_reward, transfer
    quantity DECIMAL(20, 8) NOT NULL,
    price DECIMAL(20, 8),
    total_value DECIMAL(20, 2),
    fee DECIMAL(20, 8) DEFAULT 0,
    status VARCHAR(20) DEFAULT 'pending', -- pending, completed, failed, cancelled
    transaction_hash VARCHAR(255),
    notes TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Alerts table
CREATE TABLE IF NOT EXISTS alerts (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES users(id) ON DELETE CASCADE,
    type VARCHAR(50) NOT NULL, -- price, hash_rate, temperature, earnings, etc.
    condition VARCHAR(20) NOT NULL, -- above, below, equals
    threshold_value DECIMAL(20, 8) NOT NULL,
    is_active BOOLEAN DEFAULT true,
    is_triggered BOOLEAN DEFAULT false,
    last_triggered TIMESTAMP WITH TIME ZONE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Create indexes for better performance
CREATE INDEX IF NOT EXISTS idx_users_email ON users(email);
CREATE INDEX IF NOT EXISTS idx_users_username ON users(username);
CREATE INDEX IF NOT EXISTS idx_mining_rigs_user_id ON mining_rigs(user_id);
CREATE INDEX IF NOT EXISTS idx_mining_rigs_status ON mining_rigs(status);
CREATE INDEX IF NOT EXISTS idx_mining_statistics_rig_id ON mining_statistics(rig_id);
CREATE INDEX IF NOT EXISTS idx_mining_statistics_recorded_at ON mining_statistics(recorded_at);
CREATE INDEX IF NOT EXISTS idx_cryptocurrencies_symbol ON cryptocurrencies(symbol);
CREATE INDEX IF NOT EXISTS idx_user_portfolios_user_id ON user_portfolios(user_id);
CREATE INDEX IF NOT EXISTS idx_transactions_user_id ON transactions(user_id);
CREATE INDEX IF NOT EXISTS idx_transactions_created_at ON transactions(created_at);
CREATE INDEX IF NOT EXISTS idx_alerts_user_id ON alerts(user_id);
CREATE INDEX IF NOT EXISTS idx_alerts_type ON alerts(type);

-- Create updated_at trigger function
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Create triggers for updated_at
CREATE TRIGGER update_users_updated_at BEFORE UPDATE ON users
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_mining_rigs_updated_at BEFORE UPDATE ON mining_rigs
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_mining_pools_updated_at BEFORE UPDATE ON mining_pools
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_user_portfolios_updated_at BEFORE UPDATE ON user_portfolios
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_alerts_updated_at BEFORE UPDATE ON alerts
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- Insert some initial data
INSERT INTO cryptocurrencies (symbol, name, current_price) VALUES
('BTC', 'Bitcoin', 0),
('ETH', 'Ethereum', 0),
('LTC', 'Litecoin', 0),
('DOGE', 'Dogecoin', 0),
('XMR', 'Monero', 0)
ON CONFLICT (symbol) DO NOTHING;

INSERT INTO mining_pools (name, url, port, algorithm, currency) VALUES
('F2Pool', 'stratum+tcp://btc.f2pool.com', 3333, 'SHA256', 'BTC'),
('Antpool', 'stratum+tcp://stratum-btc.antpool.com', 3333, 'SHA256', 'BTC'),
('Ethermine', 'stratum+tcp://eth.ethermine.org', 4444, 'Ethash', 'ETH'),
('MoneroOcean', 'stratum+tcp://gulf.moneroocean.stream', 10001, 'RandomX', 'XMR')
ON CONFLICT DO NOTHING;
