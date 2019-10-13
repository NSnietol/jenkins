# Tips

## **Acceder a la consola**
docker exec -ti jenkins bash

## Ingresar como root a la consola

docker exec -it -u root jenkins /bin/bash


## Crear usuarios de una fuente externa

se utiliza LDAP para tomar informacion de una base de datos

# Build con docker

docker run --rm -v /root/.m2/:/root/.m2 -v $PWD/java-app:/app -w /app maven:3-alpine mvn -B clean package -DskipTests


## Custom hooks

Son disparadores que podemos usar en git para controlar y acciones acciones en diferentes estados de los commits

1. Ubicar la ruta /var/opt/gitlabt/git-data/respositories/{{grupo}}/{{proyect}}.git
2. Crear la carpeta custom_hooks 
3. cd custom_hooks
4. Crear el hook (e.g : post or pre-receive )
5. Dar permisos de ejecución chmod 755 post-receive
6. cd ..
7. Cambiar el propietario de la carpeta custom_hooks, chown git:git custom_hooks/ -R
   


## Permisos de usuarios
Instalar 

Role-based Authorization Strategy 

    Global roles
    Permisos a usuarios

    Project roles
    Restringir proyectos por usuario

## Crear variables de entorno 

Puedes crear variables que seran visibles para todos los jobs  en el apartado de configuracion general-> Environment variables 

# Pipeline

Workflow por el que debe pasar el codigo para ser entregado con un control de 
calidad automatica

1. SCM
2. Build
3. Test
4. Deploy(Prod or Test)
   

## Ejecuciones Periodicas ( Crontab Guru)

Inside the JOB
Built Triggers -> Build periodically

Se puede parametrizar con por H
cuando la carga de jobs ejecutandose a esa hora no le permite ejecutarse en el minuto espesifico
Tiene un formato de :  * * * * *

## Params en Ansible Playbook

Cuando se usar ${VARIABLE}
Hace referencia a las de entorno,

{{VARIABLE}} hace a referencia de los parametros que recibe el Playbook

## **Generar llave shh**
ssh-keygen -f nombreLLave


## **conectar con llave ssh** 

ssh -i llave usar@dns
ssh -i remote-key remote_user@remote_host

## Copiar archivos

docker cp PATH_IN_HOST CONTAINER_NAME:PATH_IN_CONTAINER


## Subir archivos a S3

Hay varias alternativas :
1. Configurar las variables
AWS_ACCESS_KEY_ID  
AWS_SECRET_ACCESS_KEY

    export AWS_ACCESS_KEY_ID = value
    export AWS_SECRET_ACCESS_KEY= value
2. Usar Perfiles[Perfiles]

    crear el archivo ~/.aws/credentials  y agregar la información del usuario con ese formato.

    [user1]
    aws_access_key_id=AKIAI44QH8DHBEXAMPLE
    aws_secret_access_key=je7MtGbClwBF/2Zp9Utk/h3yCo8nvbEXAMPLEKEY

    para usarlo se necesita agregar --profile user1 al final del comando en el cli    


Example:

    1. aws s3 cp file s3://bucket-name

## Dump de mysql
Ubicado en un host distinto al de la base de datos.


mysqldump -u usuario -h HOST -pPASSWORD base de datos > dump.sql


# Errors 


1. ERROR 1130 (HY000): Host 'xxxx' is not allowed to connect to this MySQL server
Se presenta porque el host (127.19...) no está configurado  dentro de los host permitidos

        mysql
        mysql>SELECT HOST,User FROM mysql.user;


    Entonces cambiar el host que tiene acceso a ese rol

        mysql -u root -p
        Enter password: <enter password>
        mysql>GRANT ALL ON *.* to root@'IPSOLICITUD' IDENTIFIED BY 'put-your-password';
        mysql>FLUSH PRIVILEGES;
        mysql>exit

También se puede crear un nuevo usuario:

1) Connect to mysql
    mysql -u root -p
2) Create user
    CREATE USER 'user'@'%' IDENTIFIED BY 'password';
3) Grant permissions

    GRANT ALL PRIVILEGES ON *.* TO 'username'@'%' WITH GRANT OPTION;
4) Flush priviledges

    FLUSH PRIVILEGES;


References

1.[Perfiles] https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html


