# ship-sticks
Backend challenge for Ship Sticks


# API endpoints with sample requests

## CREATE
```ruby
POST '/products/?name=Package&type=Golf&length=36&width=12&height=12&weight=24'
```

## READ
1) shows all products (also the root route)
```ruby
GET '/products
```

2) shows one product the best matches given dimensions '/:length/:width/:height/:weight'
```ruby
GET '/products/dimensions/48/14/12/42
```

## UPDATE
```ruby
PUT '/products/:id?name=Small Package&type=Golf&length=48&width=14&height=12&weight=42'
```

## DESTROY
```ruby
DELETE '/products/56836ea58c4fb526d3000000
```
