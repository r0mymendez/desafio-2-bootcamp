#!/bin/bash

echo "Desafio 2: Romina Mendez"
echo "------------------------------------------"
FOLDER=tempdir
if [ -d "$FOLDER" ]; then
    echo "* $FOLDER exists."
else 
    mkdir -p tempdir;
    echo "* $FOLDER created."
fi
cp -R static tempdir ;
cp -R templates tempdir ;
echo "   * files and folder copy"
cd tempdir;
echo "   * files:"  $(ls);

echo "-------------------------------------------"
echo "create docker file"
cd ..
cat > Dockerfile << EOF
FROM python
RUN pip install flask
COPY ./static /home/myapp/static/
COPY ./templates /home/myapp/templates/
COPY desafio2_app.py /home/myapp/
EXPOSE 5050
CMD python3 /home/myapp/desafio2_app.py
EOF

echo "-------------------------------------------"
echo "Build docker image"
docker build -t nombreapp .;
echo "Docker run process" 
docker run -t -d -p 5050:5050 --name nombreapprunning nombreapp;
echo "Print process"
docker ps -a;

