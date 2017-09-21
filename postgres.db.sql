CREATE TABLE IF NOT EXISTS ServerInfo (uniquerow INTEGER DEFAULT 1, id VARCHAR(1024), proto BYTEA, version INTEGER, PRIMARY KEY (uniquerow));
CREATE TABLE IF NOT EXISTS Clients (id VARCHAR(1024), hbinbox TEXT, PRIMARY KEY (id));
CREATE TABLE IF NOT EXISTS Channels (id INTEGER, name VARCHAR(1024) NOT NULL, maxseq BIGINT DEFAULT 0, maxmsgs INTEGER DEFAULT 0, maxbytes BIGINT DEFAULT 0, maxage BIGINT DEFAULT 0, deleted BOOL DEFAULT FALSE, PRIMARY KEY (id));
CREATE INDEX Idx_ChannelsName ON Channels (name(256));
CREATE TABLE IF NOT EXISTS Messages (id INTEGER, seq BIGINT, timestamp BIGINT, expiration BIGINT, size INTEGER, data BYTEA, CONSTRAINT PK_MsgKey PRIMARY KEY(id, seq));
CREATE INDEX Idx_MsgsTimestamp ON Messages (timestamp);
CREATE INDEX Idx_MsgsExpiration ON Messages (expiration);
CREATE TABLE IF NOT EXISTS Subscriptions (id INTEGER, subid BIGINT, proto BYTEA, deleted BOOL DEFAULT FALSE, CONSTRAINT PK_SubKey PRIMARY KEY(id, subid));
CREATE TABLE IF NOT EXISTS SubsPending (subid BIGINT, seq BIGINT, CONSTRAINT PK_MsgPendingKey PRIMARY KEY(subid, seq));
