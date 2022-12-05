db.createUser(
    {
        user: "stickerswap",
        pwd: "010203",
        roles: [
            {
                role: "readWrite",
                db: "stickerswap"
            }
        ]
    }
);