## 使用方法

### package.json

```json
{
  "devDependencies": {
    "ts-config-zyzgroup": "*"
  }
}
```

### tsconfig.json

```json
{
  "extends": "ts-config-zyzgroup/react-library.json",
  "include": ["."],
  "exclude": ["dist", "build", "node_modules"]
}
```
