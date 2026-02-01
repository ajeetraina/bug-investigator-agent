# 🧪 Bug Scenarios for Testing

Copy-paste these into the Bug Investigator to see it in action!

---

## 1️⃣ Python: NoneType Error

```
I'm getting this error when calling an API:

TypeError: 'NoneType' object is not subscriptable
  File "app.py", line 8, in get_user_name
    return response.json()['data']['user']['name']

Code:
def get_user_name(user_id):
    response = requests.get(f"https://api.example.com/users/{user_id}")
    return response.json()['data']['user']['name']
```

---

## 2️⃣ JavaScript: Async/Await Issue

```
Getting undefined when fetching data:

const users = await fetchUsers();
console.log(users.map(u => u.name));
// TypeError: Cannot read property 'map' of undefined

async function fetchUsers() {
    const response = await fetch('/api/users');
    if (response.ok) {
        return response.json();
    }
}
```

---

## 3️⃣ Go: Nil Pointer Dereference

```
panic: runtime error: invalid memory address or nil pointer dereference
[signal SIGSEGV: segmentation violation]

goroutine 1 [running]:
main.processConfig(0x0)
    /app/main.go:15 +0x1a

Code:
func processConfig(cfg *Config) {
    fmt.Println(cfg.Database.Host)
}

func main() {
    var cfg *Config
    processConfig(cfg)
}
```

---

## 4️⃣ Docker: Build Cache Issue

```
My Docker build is slow and not caching properly.

Dockerfile:
FROM node:18
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build
CMD ["npm", "start"]
```

---

## 5️⃣ Kubernetes: CrashLoopBackOff

```
$ kubectl get pods
NAME                     READY   STATUS             RESTARTS   AGE
my-app-7d4b8c9f5-x2k3m   0/1     CrashLoopBackOff   5          3m

$ kubectl logs my-app-7d4b8c9f5-x2k3m
Error: ENOENT: no such file or directory, open '/app/config/settings.json'
```

---

## 6️⃣ React: Infinite Re-render

```
Error: Too many re-renders. React limits the number of renders.

function UserProfile({ userId }) {
    const [user, setUser] = useState(null);
    
    const fetchUser = async () => {
        const response = await fetch(`/api/users/${userId}`);
        setUser(await response.json());
    };
    
    fetchUser();  // Called on every render!
    
    return <div>{user?.name}</div>;
}
```

---

## Test Tips

1. **Start simple** - Try Python NoneType error first
2. **Watch delegation** - See how root → researcher → fixer → tester
3. **Try filesystem** - Run from test-code/ and ask "read app.py and find bugs"
4. **Use your own bugs** - Paste real errors from your projects!
