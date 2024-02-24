# README

- Database creation

```bash
rails db create
rails db:migrate
```

- How to run the test suite

- Deployment instructions

## DB

created_at は省略

```mermaid
erDiagram
  users ||--o{ registrations: "1人のユーザーは0以上の登録する"
  lectures ||--o{ registrations: "授業は0以上登録される"

 users {
    int id pk "NOT_NULL"
    string name "NOT_NULL"
    string password "NOT_NULL"
  }

  lectures {
    int id pk "NOT_NULL"
    string name "NOT_NULL"
    string description "NOT_NULL"
    int term "NOT_NULL"
  }

  registrations {
    int id pk "NOT_NULL"
    int user_id fk "NOT_NULL"
    int lecture_id fk "NOT_NULL"
  }
```

omit
授業を時間割のコマごとに管理する

```
  schedules {
    int id pk "NOT_NULL"
    int lecture_id fk "NOT_NULL"
    int timetable_id fk "NOT_NULL"
  }

  timetables {
    int id pk "NOT_NULL"
    int term "NOT_NULL"
    int day "NOT_NULL"
    int period "NOT_NULL"
  }
```

## API

### ユーザー

- ログイン
- ログアウト
- サインアップ
- パスワード変更

### 授業

- 授業一覧取得 get /v1/public/lectures
- 授業単体取得 get /v1/public/lectures/:id

### 授業登録

- 登録した授業一覧取得 get / registrations
- 授業登録 post / registrations
- 授業更新 patch / registrations
- 授業削除 delete / registrations
