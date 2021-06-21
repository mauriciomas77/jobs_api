Challenge Wispro

## Autenticación

Api desarrollada con **JWT y Bcrypt** para authenticación de usuario


## Endpoints

- Registro como usuario

```
{POST} register/
```
Como parámetro se debe indicar obligatoriamente email y password

Campos adicionales que se pueden agregar:

| Información           | Campo       |
|-----------------------|-------------|
|  Nombre               | first_name  |
|  Apellid              | last_name   |
|  Edad                 | age         |

- Registro como empresa

```
{POST} register/
```
Además de los parámetros de un usuario regular deberá indicar user_type:company en los parámetros de registro

Campos adicionales que se pueden agregar:

| Información           | Campo       |
|-----------------------|-------------|
|  Nombre de la compañía| company_name|


- Login de usuario/empresa

```
{POST} login/email=youremail@domain.com&password=yourpass
```

- Como empresa puede crear avisos de trabajo usando el siguiente endpoint:

```
{POST} advices/
```
Deberá pasar como parámetros obigatorios título y descripción y estár autenticado con token como empresa.

- Aplicaciones a avisos publicados por parte de los usuarios regulares

Para utilizar el siguiente endpoint debe estár autenticado con token como usuario regular
```
{POST} advices/:advice_id/apply
```

- Las empresas pueden cambiar el status de los aplicantes

Para utilizar este endpoint la empresa debe estar autenticada mediante token

```
{POST} advices/:advice_id/aplicants/:aplicant_id
```
Se deberá pasar por parámetro el status con el identificador asociado:

| Identificador    | Descripción |
|------------------|-------------|
|  1               | Interesa    |
|  2               | Rechazado   |
|  3               | Contratado  |


