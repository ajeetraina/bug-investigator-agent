// index.js - Sample buggy JavaScript code for testing Bug Investigator

// BUG 1: Missing return in else case
async function fetchUsers() {
    const response = await fetch('/api/users');
    if (response.ok) {
        return response.json();
    }
    // Missing else - returns undefined!
}

// BUG 2: Not handling async properly
function displayUsers() {
    const users = fetchUsers(); // Missing await!
    console.log(users.map(u => u.name)); // Will crash
}

// BUG 3: Unchecked null access
function getUserEmail(user) {
    return user.profile.email; // Crashes if profile is null
}

// BUG 4: Off-by-one error
function getLastItem(arr) {
    return arr[arr.length]; // Should be arr.length - 1
}

// BUG 5: Infinite loop risk
function findUser(users, id) {
    let i = 0;
    while (users[i].id !== id) {
        i++; // Will crash or infinite loop if user not found
    }
    return users[i];
}

module.exports = { fetchUsers, displayUsers, getUserEmail, getLastItem, findUser };
