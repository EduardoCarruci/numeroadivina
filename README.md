## Arquitectura

El proyecto implementa Clean Architecture separando claramente las capas de presentación,
dominio y datos. 

* La capa de presentación utiliza Cubit para la gestión de estado y consume
únicamente casos de uso. 

* El dominio contiene entidades y reglas de negocio independientes
de Flutter.

* La capa de datos implementa los repositorios mediante datasources remotos y
locales.  (En este caso no se utiliza ya que no se consume ningun servicio de alguna API).

* La inyección de dependencias desacopla las capas y facilita escalabilidad y testing.

## Versión de Flutter

3.16.5