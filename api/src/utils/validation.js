const { check } = require('express-validator');
exports.signupValidation = [
    check('nome', 'Nome é necessário').not().isEmpty(),
    check('email', 'O email é necessário').isEmail().normalizeEmail({ gmail_remove_dots: true }),
    check('senha', 'A senha contendo ao menos 6 caracteres é necessária').isLength({ min: 6 })
]
exports.loginValidation = [
     check('email', 'O email é necessário').isEmail().normalizeEmail({ gmail_remove_dots: true }),
     check('senha', 'A senha contendo ao menos 6 caracteres é necessária').isLength({ min: 6 })
]