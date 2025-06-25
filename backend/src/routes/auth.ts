import express from 'express';
import { register } from '../controllers/authentication/register.controller';
import { login } from '../controllers/authentication/login.controller';

const router = express.Router();

router.post('/register', register);
router.post('/login', login);

export default router;
