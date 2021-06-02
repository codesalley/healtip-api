# Healtip 
****An API that allows users to create accounts and set up appointments with health professionals both in-person and remote****


### keywords 

- `` s-token: jwt token for authentication ``
- `` type: [user, doctor] ``

## Endpoints 


- ``METHOD: POST =>  '/signup'``
  ````
  headers: {
   'Content-Type': 'application/json',
    'type':  [user or doctor],
  },
  body: [email, password, full_name, category, age, location]
    ````
- ``METHOD: POST =>  '/login'``
  ````
  headers: {
   'Content-Type': 'application/json',
    'type': [user or doctor],
  },
  body: [email, password]
    ````
- ``METHOD: GET =>  '/me'``
  ````
  headers: {
   'Content-Type': 'application/json',
   'type': [user or doctor],
   's-token': token,
  },
    ````
- ``METHOD: GET =>  '/doctors'``
  ````
  headers: {
   'Content-Type': 'application/json',
   'type': 'user',
   's-token': token,
  },
    ````
- ``METHOD: GET =>  '/appoitments'``
  ````
  headers: {
   'Content-Type': 'application/json',
   'type': 'user',
   's-token': token,
  },
    ````
- ``METHOD: POST =>  '/book'``
  ````
  headers: {
   'Content-Type': 'application/json',
   'type': 'user',
   's-token': token,
  },
	body: [user_id, doctor_id, time, location, info]
    ````
- ``METHOD: DELETE =>  '/delete/:id'``
  ````
  headers: {
   'Content-Type': 'application/json',
   'type': 'user',
   's-token': token,
  }
- ``METHOD: PUT =>  '/fav/:id'``
  ````
  headers: {
   'Content-Type': 'application/json',
   'type': 'user',
   's-token': token,
  },
- ``METHOD: PUT =>  '/unfav/:id'``
  ````
  headers: {
   'Content-Type': 'application/json',
   'type': 'user',
   's-token': token,
  },

# Gems 

- jwt
- bcrypt
- pg 

# Database 

- Postgresql

## **Author**

### Iddrisu Salley | Codesalley

- [\_\_salley | Twitter](https://twitter.com/__salley)
- [Iddrisu salley | LinkedIn](https://www.linkedin.com/in/dev-salley/)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/juxsalley/healtip-api/issues).

## Show your support

Give a ⭐️ if you like this project!
