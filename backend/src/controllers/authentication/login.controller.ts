import { Request, Response } from 'express';
import User from '../../models/User';
import bcrypt from 'bcryptjs';
import jwt from 'jsonwebtoken';

/**
 * Handle user login request.
 *
 * @route POST /auth/login
 * @param {Request} req - Express request object containing `username` and `password` in the body
 * @param {Response} res - Express response object
 * @returns {Response} JSON with JWT token or error message
 */
export const login = async (req: Request, res: Response): Promise<Response | void> => {
    try {
        const { username, password } = req.body;
        const user = await User.findOne({ where: { username } });

        if (!user || !(await bcrypt.compare(password, user.get('password') as string))) {
            return res.status(401).json({ error: 'Invalid credentials' });
        }

        const token = jwt.sign(
            { userId: user.get('id') },
            process.env.JWT_SECRET as string,
            { expiresIn: '1h' }
        );

        res.json({ token });
    } catch (err) {
        res.status(500).json({ error: 'Login failed' });
    }
};
