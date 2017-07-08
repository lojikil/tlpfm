-- You know...
-- if we create a key from the user's password
-- based off the PBKDF2, we could actually
-- do linked time stamping here. That would
-- mean that you would at least have a DAG of
-- edits therein. Also, should probably either
-- lock commits, or require that they are merged,
-- like git or like svn.
CREATE TABLE filestore (
        id INTEGER PRIMARY KEY,
        fileuuid VARCHAR(36) NOT NULL,
        useruuid VARCHAR(36) NOT NULL,
        revision INT NOT NULL,
        trafficlight INT NOT NULL, -- Cryptographic assurance...
        filetype INT NOT NULL,
        filename TEXT NOT NULL,
        filedesc TEXT NOT NULL,
        data TEXT NOT NULL) -- Tamper proofs...

CREATE TABLE users (
        id INTEGER PRIMARY KEY,
        useruuid VARCHAR(36) NOT NULL,
        username VARCHAR(128) NOT NULL,
        password VARCHAR(48) NOT NULL)

CREATE TABLE orgs (
        id INTEGER PRIMARY KEY,
        orguuid VARCHAR(36) NOT NULL,
        orgname VARCHAR(128) NOT NULL,
        orgowner VARCHAR(36) NOT NULL)

-- would be nice to cryptographically
-- prove that people were added by their
-- admin, rather than just assuming that
-- this table hasn't been tampered with.
CREATE TABLE orgmembers (
        id INTEGER PRIMARY KEY,
        orguuid VARCHAR(36) NOT NULL,
        useruuid VARCHAR(36) NOT NULL)

-- Just create an entry for each permission
-- profile. It's basically a MAC system.
-- The next idea is to *cryptographically*
-- ensure that the permissions vault hasn't
-- been tampered with.
CREATE TABLE permvault (
        id INTEGER PRIMARY KEY,
        fileuuid VARCHAR(36) NOT NULL,
        accessuuid VARCHAR(36) NOT NULL,
        trafficlight INTEGER NOT NULL,
        accessperms INTEGER NOT NULL)
