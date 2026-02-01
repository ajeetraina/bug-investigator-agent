# app.py - Sample buggy Python code for testing Bug Investigator

import requests

def get_user_name(user_id):
    """Fetch user name from API - HAS A BUG!"""
    response = requests.get(f"https://api.example.com/users/{user_id}")
    return response.json()['data']['user']['name']


def fetch_users():
    """Fetch all users - HAS A BUG!"""
    response = requests.get('/api/users')
    if response.ok:
        return response.json()
    # Missing else case - returns None!


def process_items(data):
    """Process items from data - HAS A BUG!"""
    items = data.get('items')
    total = 0
    for item in items:  # Will crash if items is None
        total += item['price']
    return total


def divide_numbers(a, b):
    """Divide two numbers - HAS A BUG!"""
    return a / b  # No zero check!


if __name__ == "__main__":
    user = get_user_name(123)
    print(f"User: {user}")
