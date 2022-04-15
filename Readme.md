# 📋Descripción

Diseñar un Script automatizado en bash - shell que permita la construccion de una aplicacion en python usando el framework Flask y en donde aplicaran los conocimientos adquiridos durante la clase 2 del bootcamp devops.

## 📋 Instrucciones

1. Forkea el repositorio

2. Crear un script con el nombre automation.sh y les dejo el modelo en el repo , que contendra lo siguiente:

y no se olviden darle permiso
```
chmod u+x automation.sh
```

2.1 Que Permita crear una carpeta temporal llamada "tempdir" y a los subdirectorios 
tempdir/templates y tempdir/static

2.2 Dentro de la carpeta "tempdir" Copiar la carpeta static/ , templates/ y la aplicación desafio2_app.py

2.3 Que el script permita construir un Dockerfile y estara ubicado en la carpeta temporal "tempdir"

2.4 Que informacion debe tener el dockerfile

```
    FROM python
    RUN pip install flask
    COPY ./static /home/myapp/static/
    COPY ./templates /home/myapp/templates/
    COPY desafio2_app.py /home/myapp/
    EXPOSE 5050
    CMD python3 /home/myapp/desafio2_app.py
```

2.5 El mismo script debe permitir la contrucción de la aplicación con 

```
docker build -t nombreapp .
```
2.6  Ademas que quede iniciando la aplicación con 
```
docker run -t -d -p 5050:5050 --name nombreapprunning nombreapp
```

2.7 y como ultimo paso del script que tenga salida 
```
docker ps -a
```
2.8. Si la construccion es correcta, recomiendo miren los logs con 
```
docker logs "CONTAINER ID"
```
```
desafio-2-bootcamp ( master ) $ docker logs 5bf4838af30f
 * Serving Flask app 'desafio2_app' (lazy loading)
 * Environment: production
   WARNING: This is a development server. Do not use it in a production deployment.
   Use a production WSGI server instead.
 * Debug mode: off
 * Running on all addresses (0.0.0.0)
   WARNING: This is a development server. Do not use it in a production deployment.
 * Running on http://127.0.0.1:5050
 * Running on http://172.17.0.2:5050 (Press CTRL+C to quit)
172.17.0.1 - - [15/Apr/2022 15:28:39] "GET / HTTP/1.1" 200 -
172.17.0.1 - - [15/Apr/2022 15:28:39] "GET /static/style.css HTTP/1.1" 200 -
172.17.0.1 - - [15/Apr/2022 15:28:39] "GET /favicon.ico HTTP/1.1" 404 -

```
2.9 Pueden validar en el navegador con http://localhost:5050 o revisen el ip con docker inspect

<img width="1072" alt="image" src="https://user-images.githubusercontent.com/39013829/163589974-4bfa2e39-60ac-4394-a23f-28cabe9620be.png">

```
docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' container_name_or_id
```

```
desafio-2-bootcamp ( master ) $ docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' 5bf4838af30f
172.17.0.2
```

⌨️ con ❤️ por [roxsross](https://github.com/roxsross) 😊

No olvides revisar mi blog [roxsross](https://blog.295devops.com) 😊

y mi linktree [roxsross](https://roxs.295devops.com) 😊

"No se trata de cambiar el mundo, creo que creas un cambio pequeño, pero que te importe estás cambiando las cosas".
