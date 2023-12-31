## Desarrollo de Preguntas

1. ¿Cuáles son las dos diferencias principales que has visto anteriormente y lo que ves en un navegador web 'normal'? ¿Qué explica estas diferencias?

- La diferencia recae sobre la funcionalidad de **`curl`** , ya que sirve para realizar solicitudes y recibir respuestas de servidores web, en este caso estamos guardando y viendo la información de la solicitud **`GET`**.

2. Suponiendo que estás ejecutando curl desde otro shell ¿qué URL tendrás que pasarle a curl para intentar acceder a tu servidor falso y por qué?

- Para acceder desde otro shell necesitaríamos indicarle la dirección IP y el puerto al cual enviar la solicitud. En este caso deberíamos usar el comando: 

    **`> curl http://192.168.105.232:8081`**

    ![IPv4](/Semana%204/Images/IPv4.PNG)

3. La primera línea de la solicitud identifica qué URL desea recuperar el cliente. ¿Por qué no ves `http://localhost:8081` en ninguna parte de esa línea?
   
- Al estar en la misma red, mostrar la dirección local host sería algo repetitivo. Cosa distinta pasaría si estuvieramos recibiendo información desde otra dirección

    **``Encabezados Servidor 'Falso'``**
    ```
    GET / HTTP/1.1
    User-Agent: Mozilla/5.0 (Windows NT; Windows NT 10.0; es-PE) WindowsPowerShell/5.1.19041.3031
    Host: localhost:8081
    Connection: Keep-Alive
    ```

4. ¿Cuál es el código de respuesta HTTP del servidor que indica el estado de la solicitud del cliente y qué versión del protocolo HTTP utilizó el servidor para responder al cliente?

    **``Respuesta HTTP``**
    
    ```
    HTTP/1.1 200 OK
    Connection: keep-alive
    Content-Type: text/html;charset=utf-8
    Content-Length: 482
    X-Xss-Protection: 1; mode=block
    X-Content-Type-Options: nosniff
    X-Frame-Options: SAMEORIGIN
    Server: WEBrick/1.4.2 (Ruby/2.6.6/2020-03-31)
    Date: Mon, 25 Sep 2023 21:01:20 GMT
    Via: 1.1 vegur
    ```

    El estado de la solicitud es indicado por la primera linea de respuesta, en este caso el código **200** nos indica que todo ha ido con normalidad.
    Por otro lado, la versión del protocolo se menciona en:  **HTTP/1.1**
    Es decir la versión es **`1.1`**

5. Cualquier solicitud web determinada puede devolver una página HTML, una imagen u otros tipos de entidades. ¿Hay algo en los encabezados que crea que le dice al cliente cómo interpretar el resultado?.

    En los encabezados de la respuesta podemos visualizar el encabezado **`Content-Type`** seguido de **`text/html;charset=utf-8`**. 
    
    **`Content-Type: text/html`**: nos informa acerca del contenido en este caso es un html; 
    
    **`charset=utf-8`**: nos especifica el tipo de codificación.

    Ejemplo con:
    
     **`> curl -i 'http://randomword.saasbook.info'`**

    ```
    HTTP/1.1 200 OK
    Connection: keep-alive
    Content-Type: text/html;charset=utf-8
    Content-Length: 482
    X-Xss-Protection: 1; mode=block
    X-Content-Type-Options: nosniff
    X-Frame-Options: SAMEORIGIN
    Server: WEBrick/1.4.2 (Ruby/2.6.6/2020-03-31)
    Date: Mon, 25 Sep 2023 21:01:20 GMT
    Via: 1.1 vegur
    ```

6. Cuando se envía un formulario HTML, se genera una solicitud HTTP POST desde el navegador. Para llegar a tu servidor falso, ¿con qué URL deberías reemplazar Url-servidor-falso en el archivo anterior?

    En el parametro action debe ser reemplazada con **`https://localhost:8081`**

    **``Index.html``**

    ```html
    <!DOCTYPE html>
    <html>
    <head>
        </head>
        <body> <form method="post" action="http://localhost:8081">
        <label>Email:</label>
        <input type="text" name="email">
            <label>Password:</label>
            <input type="password" name="password">
            <input type="hidden" name="secret_info" value="secret_value">
            <input type="submit" name="login" value="Log In!">
        </form>
        </body>
    </html> 
    ```



7. ¿Cómo se presenta al servidor la información que ingresó en el formulario? ¿Qué tareas necesitaría realizar un framework SaaS como Sinatra o Rails para presentar esta información en un formato conveniente a una aplicación SaaS escrita, por ejemplo, en Ruby?
   
   Se presenta como parte de la solicitud **``POST HTTP``**

    **``Solicitud POST``**
    ```
    POST / HTTP/1.1
    Host: localhost:8081
    Connection: keep-alive
    Content-Length: 93
    Cache-Control: max-age=0
    sec-ch-ua: "Microsoft Edge";v="117", "Not;A=Brand";v="8", "Chromium";v="117"
    sec-ch-ua-mobile: ?0
    sec-ch-ua-platform: "Windows"
    Upgrade-Insecure-Requests: 1
    Origin: null
    Content-Type: application/x-www-form-urlencoded
    User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36 Edg/117.0.2045.31
    Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7
    Sec-Fetch-Site: cross-site
    Sec-Fetch-Mode: navigate
    Sec-Fetch-User: ?1
    Sec-Fetch-Dest: document
    Accept-Encoding: gzip, deflate, br
    Accept-Language: es,es-ES;q=0.9,en;q=0.8,en-GB;q=0.7,en-US;q=0.6
    ```
   
   La información ingresada en un formulario se presenta al servidor en la solicitud HTTP, y un framework como Sinatra o Ruby on Rails se encargaría de procesar y utilizar esos datos según las necesidades de la aplicación, como por ejemplo almacenarlos en una base de datos, realizar cálculos, mostrarlos en una vista o realizar cualquier otra tarea relacionada con la lógica de la aplicación.


8. ¿Cuál es el efecto de agregar parámetros URI adicionales como parte de la ruta POST?



9. ¿Cuál es el efecto de cambiar las propiedades de nombre de los campos del formulario?


10. ¿Puedes tener más de un botón Submit? Si es así, ¿cómo sabe el servidor en cuál se hizo clic? (Sugerencia: experimenta con los atributos de la etiqueta <submit>).


11. ¿Se puede enviar el formulario mediante GET en lugar de POST? En caso afirmativo, ¿cuál es la diferencia en cómo el servidor ve esas solicitudes?



12. ¿Qué otros verbos HTTP son posibles en la ruta de envío del formulario? ¿Puedes hacer que el navegador web genere una ruta que utilice PUT, PATCH o DELETE?.