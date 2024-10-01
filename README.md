### To build image from Docker file locally 

docker build -t yogender027/postgrestemdb-image .

### To run the image locally:

docker run -d \
  --name mydb-container \
  -e POSTGRES_DB=mydb \
  -e POSTGRES_USER=postgres \
  -e POSTGRES_PASSWORD=postgres \
  -p 5433:5432 \
  yogender027/postgrestemdb-image


### Image pushed to Docker registery:

yogender027/postgrestemdb-image:1.0.0