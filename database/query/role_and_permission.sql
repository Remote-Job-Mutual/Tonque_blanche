-- Create the permissions table
CREATE TABLE permissions (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    guard_name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NULL DEFAULT NULL,
    updated_at TIMESTAMP NULL DEFAULT NULL,
    UNIQUE KEY unique_name_guard_name (name, guard_name)
);

-- Create the roles table
CREATE TABLE roles (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    team_foreign_key BIGINT UNSIGNED NULL,
    name VARCHAR(255) NOT NULL,
    guard_name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NULL DEFAULT NULL,
    updated_at TIMESTAMP NULL DEFAULT NULL,
    INDEX roles_team_foreign_key_index (team_foreign_key),
    UNIQUE KEY unique_name_guard_name_team (team_foreign_key, name, guard_name),
    UNIQUE KEY unique_name_guard_name (name, guard_name)
);

-- Create the model_has_permissions table
CREATE TABLE model_has_permissions (
    permission_id BIGINT UNSIGNED NOT NULL,
    model_type VARCHAR(255) NOT NULL,
    model_morph_key BIGINT UNSIGNED NOT NULL,
    team_foreign_key BIGINT UNSIGNED NULL,
    PRIMARY KEY (team_foreign_key, permission_id, model_morph_key, model_type),
    INDEX model_has_permissions_model_id_model_type_index (model_morph_key, model_type),
    FOREIGN KEY (permission_id) REFERENCES permissions(id) ON DELETE CASCADE,
    INDEX model_has_permissions_team_foreign_key_index (team_foreign_key)
);

-- Create the model_has_roles table
CREATE TABLE model_has_roles (
    role_id BIGINT UNSIGNED NOT NULL,
    model_type VARCHAR(255) NOT NULL,
    model_morph_key BIGINT UNSIGNED NOT NULL,
    team_foreign_key BIGINT UNSIGNED NULL,
    PRIMARY KEY (team_foreign_key, role_id, model_morph_key, model_type),
    INDEX model_has_roles_model_id_model_type_index (model_morph_key, model_type),
    FOREIGN KEY (role_id) REFERENCES roles(id) ON DELETE CASCADE,
    INDEX model_has_roles_team_foreign_key_index (team_foreign_key)
);

-- Create the role_has_permissions table
CREATE TABLE role_has_permissions (
    permission_id BIGINT UNSIGNED NOT NULL,
    role_id BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY (permission_id, role_id),
    FOREIGN KEY (permission_id) REFERENCES permissions(id) ON DELETE CASCADE,
    FOREIGN KEY (role_id) REFERENCES roles(id) ON DELETE CASCADE
);
