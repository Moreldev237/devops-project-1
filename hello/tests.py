from django.test import TestCase

# Create your tests here.
#test pour vérifier que la page hello fonctionne correctement
class HelloViewTest(TestCase):
    def test_hello_view(self):
        response = self.client.get('/hello/')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.content.decode(), "Hello, World!")
