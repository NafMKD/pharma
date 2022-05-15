CREATE TABLE users(
    id INT PRIMARY KEY AUTO_INCREMENT, 
    username VARCHAR(50),
    password VARCHAR(300),
    last_login DATETIME,
    is_superuser BOOLEAN,
    is_president BOOLEAN,
    profile_picture VARCHAR(300),
    is_active BOOLEAN,
    deactivated_at DATETIME,
    created_at DATETIME,
    updated_at DATETIME
);

CREATE TABLE users_details(
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    student_id VARCHAR(50),
    first_name VARCHAR(150),
    last_name VARCHAR(150),
    phone VARCHAR(15),
    gender VARCHAR(10),
    year YEAR,
    is_active BOOLEAN,
    created_at DATETIME,
    updated_at DATETIME,
    FOREIGN KEY(user_id) REFERENCES users(id)
);

CREATE TABLE divisions(
   	id INT PRIMARY KEY AUTO_INCREMENT,
    division_head_id INT DEFAULT NULL,
   	name VARCHAR(25),
    description TEXT,
    is_active BOOLEAN,
    created_at DATETIME,
    updated_at DATETIME,
    FOREIGN KEY(division_head_id) REFERENCES users(id)
);

CREATE TABLE users_divisions(
   	id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    division_id INT,
    is_active BOOLEAN,
    created_at DATETIME,
    updated_at DATETIME,
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(division_id) REFERENCES divisions(id)
);

CREATE TABLE events(
   	id INT PRIMARY KEY AUTO_INCREMENT,
    division_id INT,
    title VARCHAR(50),
    description TEXT,
    image_url VARCHAR(300),
    start_date DATETIME,
    end_date DATETIME,
    is_public BOOLEAN,
    is_active BOOLEAN,
    created_at DATETIME,
    updated_at DATETIME,
    FOREIGN KEY(division_id) REFERENCES divisions(id)
);

CREATE TABLE feeds(
   	id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    event_id INT DEFAULT NULL,
    title VARCHAR(50),
    description TEXT,
    is_active BOOLEAN,
    created_at DATETIME,
    updated_at DATETIME,
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(event_id) REFERENCES events(id)
);

CREATE TABLE feeds_files(
   	id INT PRIMARY KEY AUTO_INCREMENT,
    feed_id INT,
    file_url VARCHAR(300),
    is_active BOOLEAN,
    created_at DATETIME,
    updated_at DATETIME,
    FOREIGN KEY(feed_id) REFERENCES feeds(id)
);

CREATE TABLE attendances(
   	id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    event_id INT,
    is_active BOOLEAN,
    created_at DATETIME,
    updated_at DATETIME,
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(event_id) REFERENCES events(id)
);