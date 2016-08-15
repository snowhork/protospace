# DB design

## users
* nickname
* email
* password
* avatar
* member
* profile
* works
* prototype_count

## prototypes
* title
* catch_copy
* concept
* user_id
* comments_count
* likes_count

## comments
* text
* prototype_id
* user_id

## likes
* prototype_id
* user_id

## images
* substance
* prototype_id

# コーディング規則

## クォーテーションの使い方
式展開やバックスラッシュ記法など特別な時のみダブルクォーテーション。その他通常時はシングルクォーテーション。

```
# bad
x = "Hello World!"

# good
x = 'Hello World!'
```
