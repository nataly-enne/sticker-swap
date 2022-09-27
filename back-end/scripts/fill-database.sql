USE stickerswap;

DELETE FROM user;

INSERT INTO user SET username = "admin", password = "$2a$10$rFrnGh2Dk2E50LIpHzMVDOcI0g6EsZ6szOjW3lmLHsHY8Rw32UXX6", email = "admin@admin.com", create_time = now();
INSERT INTO user SET username = "usuario1", password = "$2a$10$rFrnGh2Dk2E50LIpHzMVDOcI0g6EsZ6szOjW3lmLHsHY8Rw32UXX6", email = "usuario1@email.com", create_time = now();
INSERT INTO user SET username = "usuario2", password = "$2a$10$rFrnGh2Dk2E50LIpHzMVDOcI0g6EsZ6szOjW3lmLHsHY8Rw32UXX6", email = "usuario2@email.com", create_time = now();