# selenium sample

## Required

- jdk 16
- chromedriver
- ruby 3.0.0

## Usage

### download selenium server

https://www.selenium.dev/downloads/

### run selenium server

```
java -jar selenium-server-4.0.0-beta-4.jar standalone
```

### run sample

```
bundle install
```

```
export browser=firefox
bundle exec rspec example.rb
```

### 環境変数 browser の値

- chrome : Chrome （デフォルト）  
- firefox : Firefox
- edge : MS Edge
