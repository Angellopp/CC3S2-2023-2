## Desarrollo de Preguntas

1. ¿Cuáles son las dos diferencias principales que has visto anteriormente y lo que ves en un navegador web 'normal'? ¿Qué explica estas diferencias?

- La diferencia recae sobre la funcionalidad de **`curl`** , ya que sirve para realizar solicitudes y recibir respuestas de servidores web, en este caso estamos guardando y viendo la información de la solicitud **`GET`**.

2. Suponiendo que estás ejecutando curl desde otro shell ¿qué URL tendrás que pasarle a curl para intentar acceder a tu servidor falso y por qué?

- Para acceder desde otro shell necesitaríamos indicarle la dirección IP y el puerto al cual enviar la solicitud. En este caso deberíamos usar el comando: 

    `> curl http://192.168.105.232:8081`

    ![IPv4](/Semana%204/Images/IPv4.PNG)

3. La primera línea de la solicitud identifica qué URL desea recuperar el cliente. ¿Por qué no ves http://localhost:8081 en ninguna parte de esa línea?
Al estar en la misma red, mostrar la dirección local host sería algo repetitivo. Cosa distinta pasaría si estuvieramos recibiendo información desde otra dirección

Encabezados localhost

GET / HTTP/1.1
Host: localhost:8081
User-Agent: curl/7.81.0
Accept: */*

Encabezados de curl -i 'http://randomword.saasbook.info'

HTTP/1.1 200 OK
Connection: keep-alive
Content-Type: text/html;charset=utf-8
Content-Length: 482
X-Xss-Protection: 1; mode=block
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
Server: WEBrick/1.4.2 (Ruby/2.6.6/2020-03-31)
Date: Mon, 25 Sep 2023 17:18:38 GMT
Via: 1.1 vegur


4.¿cuál es el código de respuesta HTTP del servidor que indica el estado de la solicitud del cliente y qué versión del protocolo HTTP utilizó el servidor para responder al cliente?

El estado de la solicitud es indicado por la primera linea de respuesta, en este caso el código 200 nos indica que todo ha ido con normalidad.
Por otro lado, la versión del protocolo se menciona en:  HTTP/1.1
Es decir la versión es 1.1

5.Cualquier solicitud web determinada puede devolver una página HTML, una imagen u otros tipos de entidades. ¿Hay algo en los encabezados que crea que le dice al cliente cómo interpretar el resultado?.

En los encabezados de la respuesta podemos visualizar el encabezado "Content-Type" seguido de "text/html;charset=utf-8". La primera parte de esta cadena nos informa acerca del contenido en este caso es un html; La segunda parte, nos especifica el tipo de codificación.

6.Cuando se envía un formulario HTML, se genera una solicitud HTTP POST desde el navegador. Para llegar a tu servidor falso, ¿con qué URL deberías reemplazar Url-servidor-falso en el archivo anterior?
En el parametro action debe ser reemplazada con https://localhost:8081 

7.¿Cómo se presenta al servidor la información que ingresó en el formulario? ¿Qué tareas necesitaría realizar un framework SaaS como Sinatra o Rails para presentar esta información en un formato conveniente a una aplicación SaaS escrita, por ejemplo, en Ruby?
La información devuelta mediante el POST, parece estar dañada. Es así que mediante el uso de un framework podemos darle una codificación.


    ¿Cuál es el efecto de agregar parámetros URI adicionales como parte de la ruta POST?
    
    ¿Cuál es el efecto de cambiar las propiedades de nombre de los campos del formulario?
    ¿Puedes tener más de un botón Submit? Si es así, ¿cómo sabe el servidor en cuál se hizo clic? (Sugerencia: experimenta con los atributos de la etiqueta <submit>).
    ¿Se puede enviar el formulario mediante GET en lugar de POST? En caso afirmativo, ¿cuál es la diferencia en cómo el servidor ve esas solicitudes?
    ¿Qué otros verbos HTTP son posibles en la ruta de envío del formulario? ¿Puedes hacer que el navegador web genere una ruta que utilice PUT, PATCH o DELETE?.