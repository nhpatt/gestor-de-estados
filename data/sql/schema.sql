CREATE TABLE artefacto_version (id BIGINT, nombre VARCHAR(255) NOT NULL, descripcion TEXT NOT NULL, tipo_id BIGINT NOT NULL, proyecto_id BIGINT NOT NULL, validado TINYINT(1), created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, version BIGINT, PRIMARY KEY(id, version)) ENGINE = INNODB;
CREATE TABLE artefacto (id BIGINT AUTO_INCREMENT, nombre VARCHAR(255) NOT NULL, descripcion TEXT NOT NULL, tipo_id BIGINT NOT NULL, proyecto_id BIGINT NOT NULL, validado TINYINT(1), created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, version BIGINT, INDEX proyecto_id_idx (proyecto_id), INDEX tipo_id_idx (tipo_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE asignacion_proyectos (user_id BIGINT, proyecto_id BIGINT, PRIMARY KEY(user_id, proyecto_id)) ENGINE = INNODB;
CREATE TABLE asignacion_trabajadores (user_id BIGINT, version_id BIGINT, PRIMARY KEY(user_id, version_id)) ENGINE = INNODB;
CREATE TABLE asignacion_trabajadores_art (user_id BIGINT, artefacto_id BIGINT, PRIMARY KEY(user_id, artefacto_id)) ENGINE = INNODB;
CREATE TABLE estado (id BIGINT AUTO_INCREMENT, nombre VARCHAR(255) NOT NULL UNIQUE, descripcion VARCHAR(255), fase VARCHAR(255), edicion TINYINT(1), created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE estado_hijo (padre_id BIGINT, hijo_id BIGINT, mensaje VARCHAR(255), PRIMARY KEY(padre_id, hijo_id)) ENGINE = INNODB;
CREATE TABLE ficheros (id BIGINT AUTO_INCREMENT, nombre VARCHAR(100), file VARCHAR(255), versionid BIGINT NOT NULL, descripcion VARCHAR(200), deleted TINYINT(1), INDEX versionid_idx (versionid), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE ficherosArt (id BIGINT AUTO_INCREMENT, nombre VARCHAR(100), file VARCHAR(255), artefactoid BIGINT NOT NULL, descripcion VARCHAR(200), deleted TINYINT(1), INDEX artefactoid_idx (artefactoid), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE linea_base_version (id BIGINT, nombre VARCHAR(255) NOT NULL, descripcion TEXT NOT NULL, proyecto_id BIGINT NOT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, version BIGINT, PRIMARY KEY(id, version)) ENGINE = INNODB;
CREATE TABLE linea_base (id BIGINT AUTO_INCREMENT, nombre VARCHAR(255) NOT NULL, descripcion TEXT NOT NULL, proyecto_id BIGINT NOT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, version BIGINT, INDEX proyecto_id_idx (proyecto_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE lineas_version (linea_base_id BIGINT, version_id BIGINT, PRIMARY KEY(linea_base_id, version_id)) ENGINE = INNODB;
CREATE TABLE mensaje (id BIGINT AUTO_INCREMENT, nombre TEXT NOT NULL, descripcion TEXT NOT NULL, leido TINYINT(1), user_id BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX user_id_idx (user_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE proyecto (id BIGINT AUTO_INCREMENT, nombre VARCHAR(255) NOT NULL UNIQUE, descripcion TEXT NOT NULL, url VARCHAR(255), created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, slug VARCHAR(255), UNIQUE INDEX proyecto_sluggable_idx (slug), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE relaciones (padre_id BIGINT, hijo_id BIGINT, PRIMARY KEY(padre_id, hijo_id)) ENGINE = INNODB;
CREATE TABLE tipo (id BIGINT AUTO_INCREMENT, nombre VARCHAR(255) NOT NULL UNIQUE, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE version_version (id BIGINT, nombre VARCHAR(255) NOT NULL, identificador BIGINT NOT NULL, descripcion TEXT, tipo_id BIGINT NOT NULL, estado_id BIGINT NOT NULL, artefacto_id BIGINT NOT NULL, validada TINYINT(1) NOT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, version BIGINT, PRIMARY KEY(id, version)) ENGINE = INNODB;
CREATE TABLE version (id BIGINT AUTO_INCREMENT, nombre VARCHAR(255) NOT NULL, identificador BIGINT NOT NULL, descripcion TEXT, tipo_id BIGINT NOT NULL, estado_id BIGINT NOT NULL, artefacto_id BIGINT NOT NULL, validada TINYINT(1) NOT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, version BIGINT, INDEX estado_id_idx (estado_id), INDEX tipo_id_idx (tipo_id), INDEX artefacto_id_idx (artefacto_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE sf_guard_forgot_password (id BIGINT AUTO_INCREMENT, user_id BIGINT NOT NULL, unique_key VARCHAR(255), expires_at DATETIME NOT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX user_id_idx (user_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE sf_guard_group (id BIGINT AUTO_INCREMENT, name VARCHAR(255) UNIQUE, description TEXT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE sf_guard_group_permission (group_id BIGINT, permission_id BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(group_id, permission_id)) ENGINE = INNODB;
CREATE TABLE sf_guard_permission (id BIGINT AUTO_INCREMENT, name VARCHAR(255) UNIQUE, description TEXT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE sf_guard_remember_key (id BIGINT AUTO_INCREMENT, user_id BIGINT, remember_key VARCHAR(32), ip_address VARCHAR(50), created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX user_id_idx (user_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE sf_guard_user (id BIGINT AUTO_INCREMENT, first_name VARCHAR(255), last_name VARCHAR(255), email_address VARCHAR(255) NOT NULL UNIQUE, username VARCHAR(128) NOT NULL UNIQUE, algorithm VARCHAR(128) DEFAULT 'sha1' NOT NULL, salt VARCHAR(128), password VARCHAR(128), is_active TINYINT(1) DEFAULT '1', is_super_admin TINYINT(1) DEFAULT '0', last_login DATETIME, asignacion_id BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX is_active_idx_idx (is_active), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE sf_guard_user_group (user_id BIGINT, group_id BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(user_id, group_id)) ENGINE = INNODB;
CREATE TABLE sf_guard_user_permission (user_id BIGINT, permission_id BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(user_id, permission_id)) ENGINE = INNODB;
ALTER TABLE artefacto_version ADD CONSTRAINT artefacto_version_id_artefacto_id FOREIGN KEY (id) REFERENCES artefacto(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE artefacto ADD CONSTRAINT artefacto_tipo_id_tipo_id FOREIGN KEY (tipo_id) REFERENCES tipo(id);
ALTER TABLE artefacto ADD CONSTRAINT artefacto_proyecto_id_proyecto_id FOREIGN KEY (proyecto_id) REFERENCES proyecto(id);
ALTER TABLE asignacion_proyectos ADD CONSTRAINT asignacion_proyectos_user_id_sf_guard_user_id FOREIGN KEY (user_id) REFERENCES sf_guard_user(id);
ALTER TABLE asignacion_proyectos ADD CONSTRAINT asignacion_proyectos_proyecto_id_proyecto_id FOREIGN KEY (proyecto_id) REFERENCES proyecto(id);
ALTER TABLE asignacion_trabajadores ADD CONSTRAINT asignacion_trabajadores_version_id_version_id FOREIGN KEY (version_id) REFERENCES version(id);
ALTER TABLE asignacion_trabajadores ADD CONSTRAINT asignacion_trabajadores_user_id_sf_guard_user_id FOREIGN KEY (user_id) REFERENCES sf_guard_user(id);
ALTER TABLE asignacion_trabajadores_art ADD CONSTRAINT asignacion_trabajadores_art_user_id_sf_guard_user_id FOREIGN KEY (user_id) REFERENCES sf_guard_user(id);
ALTER TABLE asignacion_trabajadores_art ADD CONSTRAINT asignacion_trabajadores_art_artefacto_id_artefacto_id FOREIGN KEY (artefacto_id) REFERENCES artefacto(id);
ALTER TABLE estado_hijo ADD CONSTRAINT estado_hijo_padre_id_estado_id FOREIGN KEY (padre_id) REFERENCES estado(id);
ALTER TABLE estado_hijo ADD CONSTRAINT estado_hijo_hijo_id_estado_id FOREIGN KEY (hijo_id) REFERENCES estado(id);
ALTER TABLE ficheros ADD CONSTRAINT ficheros_versionid_version_id FOREIGN KEY (versionid) REFERENCES version(id);
ALTER TABLE ficherosArt ADD CONSTRAINT ficherosArt_artefactoid_artefacto_id FOREIGN KEY (artefactoid) REFERENCES artefacto(id);
ALTER TABLE linea_base_version ADD CONSTRAINT linea_base_version_id_linea_base_id FOREIGN KEY (id) REFERENCES linea_base(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE linea_base ADD CONSTRAINT linea_base_proyecto_id_proyecto_id FOREIGN KEY (proyecto_id) REFERENCES proyecto(id);
ALTER TABLE lineas_version ADD CONSTRAINT lineas_version_version_id_version_id FOREIGN KEY (version_id) REFERENCES version(id);
ALTER TABLE lineas_version ADD CONSTRAINT lineas_version_linea_base_id_linea_base_id FOREIGN KEY (linea_base_id) REFERENCES linea_base(id);
ALTER TABLE mensaje ADD CONSTRAINT mensaje_user_id_sf_guard_user_id FOREIGN KEY (user_id) REFERENCES sf_guard_user(id);
ALTER TABLE relaciones ADD CONSTRAINT relaciones_padre_id_artefacto_id FOREIGN KEY (padre_id) REFERENCES artefacto(id);
ALTER TABLE relaciones ADD CONSTRAINT relaciones_hijo_id_artefacto_id FOREIGN KEY (hijo_id) REFERENCES artefacto(id);
ALTER TABLE version_version ADD CONSTRAINT version_version_id_version_id FOREIGN KEY (id) REFERENCES version(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE version ADD CONSTRAINT version_tipo_id_tipo_id FOREIGN KEY (tipo_id) REFERENCES tipo(id);
ALTER TABLE version ADD CONSTRAINT version_estado_id_estado_id FOREIGN KEY (estado_id) REFERENCES estado(id);
ALTER TABLE version ADD CONSTRAINT version_artefacto_id_artefacto_id FOREIGN KEY (artefacto_id) REFERENCES artefacto(id);
ALTER TABLE sf_guard_forgot_password ADD CONSTRAINT sf_guard_forgot_password_user_id_sf_guard_user_id FOREIGN KEY (user_id) REFERENCES sf_guard_user(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_group_permission ADD CONSTRAINT sf_guard_group_permission_permission_id_sf_guard_permission_id FOREIGN KEY (permission_id) REFERENCES sf_guard_permission(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_group_permission ADD CONSTRAINT sf_guard_group_permission_group_id_sf_guard_group_id FOREIGN KEY (group_id) REFERENCES sf_guard_group(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_remember_key ADD CONSTRAINT sf_guard_remember_key_user_id_sf_guard_user_id FOREIGN KEY (user_id) REFERENCES sf_guard_user(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_user_group ADD CONSTRAINT sf_guard_user_group_user_id_sf_guard_user_id FOREIGN KEY (user_id) REFERENCES sf_guard_user(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_user_group ADD CONSTRAINT sf_guard_user_group_group_id_sf_guard_group_id FOREIGN KEY (group_id) REFERENCES sf_guard_group(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_user_permission ADD CONSTRAINT sf_guard_user_permission_user_id_sf_guard_user_id FOREIGN KEY (user_id) REFERENCES sf_guard_user(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_user_permission ADD CONSTRAINT sf_guard_user_permission_permission_id_sf_guard_permission_id FOREIGN KEY (permission_id) REFERENCES sf_guard_permission(id) ON DELETE CASCADE;
