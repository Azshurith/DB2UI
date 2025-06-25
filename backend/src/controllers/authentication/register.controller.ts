import { Request, Response } from 'express';
import User from '../../models/User';
import bcrypt from 'bcryptjs';

/**
 * Handle user registration request.
 *
 * @route POST /auth/register
 * @param {Request} req - Express request object containing `username` and `password` in the body
 * @param {Response} res - Express response object
 * @returns {Response} JSON with created user info or error message
 */
export const register = async (req: Request, res: Response): Promise<Response | void> => {
    try {
        const { username, password } = req.body;
        const hashed = await bcrypt.hash(password, 10);
        const user = await User.create({ username, password: hashed });

        res.status(201).json({
            message: 'User created',
            user: {
                id: user.get('id'),
                username: user.get('username'),
            },
        });
    } catch (err) {
        res.status(400).json({ error: 'Username may already exist' });
    }
};
