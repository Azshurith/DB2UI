import express from 'express';
import authRoutes from './auth';

const router = express.Router();

router.use('/auth', authRoutes);

/**
 * Dummy post route
 */
router.get('/posts', (req, res) => {
    res.json([{ id: 1, title: 'Hello World', content: 'This is your first post.' }]);
});

/**
 * Test route to verify server is alive
 */
router.get('/test', (req, res) => {
    res.status(200).json({
        message: 'Test route is working Test ✅',
        timestamp: new Date().toISOString()
    });
});

export default router;
