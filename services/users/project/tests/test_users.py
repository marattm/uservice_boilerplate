# services/users/project/tests/test_users.py
import json
import unittest

# from project import db
# from project.api.models import User
from project.tests.base import BaseTestCase


class TestUserService(BaseTestCase):
    """Tests for the Users Service."""

    def test_users(self):
        """Ensure the /api/v0/users/health route behaves correctly."""
        rv = self.client.get('/api/v0/users/health')
        data = json.loads(rv.data.decode())
        self.assertEqual(rv.status_code, 200)
        self.assertIn('Users service healthy!', data['message'])
        self.assertIn('success', data['status'])


if __name__ == '__main__':
    unittest.main()
