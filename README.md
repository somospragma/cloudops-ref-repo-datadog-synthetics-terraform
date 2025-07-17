# Módulo Terraform: cloudops-ref-repo-datadog-synthetics-terraform

## Descripción:
Este módulo permite configurar y gestionar Browser Tests sintéticos en Datadog mediante Terraform, facilitando la creación y mantenimiento de monitoreos automatizados para evaluar la experiencia del usuario final en aplicaciones web. Ideal para implementar monitoreo preventivo que detecte errores en flujos críticos antes de que impacten a los usuarios.

- Crear pruebas de navegación en navegador: Configura pruebas multipasos que simulan el recorrido real de un usuario en una aplicación web, permitiendo detectar errores funcionales y problemas de rendimiento en interfaces críticas.

- Definir alertas personalizadas: Establece umbrales de falla (por ejemplo, si un paso falla o una página tarda demasiado en cargar) para activar notificaciones automáticas. Esto facilita respuestas rápidas ante caídas o regresiones en la experiencia del usuario.

- Automatizar validaciones de funcionalidades clave: Valida la correcta carga de elementos, flujos de login, formularios, búsquedas y otras funcionalidades esenciales en tus aplicaciones desde el punto de vista del navegador.

- Configurar frecuencia de ejecución: Permite definir cada cuánto se ejecutan las pruebas (por ejemplo, cada 5 minutos), ajustándose al nivel de criticidad del flujo monitorizado.

- Personalizar ubicaciones de prueba: Selecciona ubicaciones de puntos de presencia globales para simular cómo se comporta tu aplicación desde distintas geografías.

- Integración con sistemas de notificación: Las alertas generadas por fallas en las pruebas pueden ser enviadas automáticamente a canales como Slack, correo electrónico o webhooks.

- Documentación de resultados y métricas: Cada prueba ejecutada genera un historial detallado con capturas, tiempos de carga por paso, errores encontrados, y comparativas de desempeño a lo largo del tiempo.

Consulta el archivo CHANGELOG.md para conocer los cambios por versión.
Recomendamos fijar explícitamente la versión del módulo en tu código para garantizar estabilidad y facilitar actualizaciones controladas.

## Estructura del Módulo
El módulo cuenta con la siguiente estructura:

```bash
cloudops-ref-repo-aws-vpc-terraform/
├── CHANGELOG.md
├── data.tf
├── main.tf
├── outputs.tf
├── providers.tf
├── README.md
├── variables.tf
└── sample/
    ├── data.tf
    ├── main.tf
    ├── outputs.tf
    ├── terraform.tfvars.sample
    └── variables.tf
```

- Los archivos principales del módulo (data.tf, main.tf, outputs.tf, variables.tf, providers.tf) se encuentran en el directorio raíz.
- CHANGELOG.md y README.md también están en el directorio raíz para fácil acceso.
- La carpeta sample/ contiene un ejemplo funcional para implementar una prueba de tipo Browser Test usando este módulo.
