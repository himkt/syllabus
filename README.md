# Syllabus

## URL

https://itf-syllabus.herokuapp.com

## API

```
GET /api/v1/search
```

### Parameter

```
key=value (複数ある時は&でつなげる)
```

```
scode: 科目コード(部分一致検索)
sname: 科目名(部分一致検索)
unit:  単位数(完全一致検索)
grade: 標準履修年次(部分一致検索)
semester: 学期(部分一致検索)
time: 曜時限(部分一致検索)
location: 教室(部分一致検索)
lecturer: 教員(部分一致検索)
summary: 概要(部分一致検索)
note: 備考(部分一致検索)
alternative: 英名(部分一致検索)
```

### Example

```
https://itf-syllabus.herokuapp.com/api/v1/search
```

```
https://itf-syllabus.herokuapp.com/api/v1/search?sname=図書館&unit=2&semester=春&grade=2&note=図書館
```
